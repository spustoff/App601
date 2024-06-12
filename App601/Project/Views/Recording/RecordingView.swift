//
//  RecordingView.swift
//  App601
//
//  Created by IGOR on 05/06/2024.
//

import SwiftUI

struct RecordingView: View {
    
    @StateObject var viewModel = RecordingViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Recording the game")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 13) {
                        
                        HStack {
                            
                            ForEach(viewModel.results, id: \.self) { index in
                            
                                HStack {
                                    
                                    Button(action: {
                                        
                                        viewModel.currentResult = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currentResult == index ? .white : .black)
                                            .font(.system(size: 13, weight: .regular))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 45)
                                            .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.currentResult == index ? Color("prim") : .white))
                                    })
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                        
                        VStack {
                            
                            Text("Type of game")
                                .foregroundColor(.black)
                                .font(.system(size: 11, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.hisType.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.hisType)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
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
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("12 june 2024")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.hisDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.hisDate)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
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
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.hisChamp.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.hisChamp)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
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
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.hisRole.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.hisRole)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                        
                        VStack {

                            Text("Descroption")
                                .foregroundColor(.black)
                                .font(.system(size: 11, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.hisDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.hisDescr)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                                                
                        Button(action: {
                            
                            viewModel.hisResult = viewModel.currentResult
                            
                            if viewModel.currentResult == "Victory" {
                                
                                viewModel.vic += 1
                                
                            } else if viewModel.currentResult == "Defeat" {
                                
                                viewModel.def += 1
                            }
                            
                            viewModel.allGames += 1
                            
                            viewModel.addHistory()
                            
                            viewModel.hisType = ""
                            viewModel.hisDate = ""
                            viewModel.hisRole = ""
                            viewModel.hisDescr = ""
                            viewModel.hisChamp = ""
                            
                            viewModel.fetchHistories()
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    RecordingView()
}
