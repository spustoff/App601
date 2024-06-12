//
//  HisDetail.swift
//  App601
//
//  Created by IGOR on 05/06/2024.
//

import SwiftUI

struct HisDetail: View {
    
    @StateObject var viewModel: RecordingViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                    }
                })
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 14) {
                        
                        HStack {
                            
                            Text("Victory")
                                .foregroundColor((viewModel.selectedHistory?.hisResult ?? "") == "Victory" ? .white : .black)
                                .font(.system(size: 13, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill((viewModel.selectedHistory?.hisResult ?? "") == "Victory" ? Color("prim") : .white))
                            
                            Text("Defeat")
                                .foregroundColor((viewModel.selectedHistory?.hisResult ?? "") == "Defeat" ? .white : .black)
                                .font(.system(size: 13, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill((viewModel.selectedHistory?.hisResult ?? "") == "Defeat" ? Color("prim") : .white))
                            
                        }
                        .padding()
                        
                        Text("Type of game")
                            .foregroundColor(.black)
                            .font(.system(size: 11, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedHistory?.hisType ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 20)
                        
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 8)
                        
                        Text("Date")
                            .foregroundColor(.black)
                            .font(.system(size: 11, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedHistory?.hisDate ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 20)
                        
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 8)
                        
                        Text("Champion")
                            .foregroundColor(.black)
                            .font(.system(size: 11, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedHistory?.hisChamp ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 20)
                        
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 8)
                        
                        Text("Role")
                            .foregroundColor(.black)
                            .font(.system(size: 11, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedHistory?.hisRole ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 20)
                        
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 8)
                        
                        Text("Description")
                            .foregroundColor(.black)
                            .font(.system(size: 11, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedHistory?.hisDescr ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 20)
                        
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 8)
                    }
                }
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 15, weight: .regular))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            router.wrappedValue.dismiss()
                        }
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteHistory(withHisType: viewModel.selectedHistory?.hisType ?? "", completion: {
                            
                            viewModel.fetchHistories()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    HisDetail(viewModel: RecordingViewModel())
}
