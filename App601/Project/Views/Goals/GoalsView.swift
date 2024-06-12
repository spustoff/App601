//
//  GoalsView.swift
//  App601
//
//  Created by IGOR on 05/06/2024.
//

import SwiftUI

struct GoalsView: View {
    
    @StateObject var viewModel = RecordingViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Goals")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddGoal = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Add a goal")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    }
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 12) {
                        
                        ForEach(viewModel.goals, id: \.self) { index in
                            
                            VStack(spacing: 8) {
                                
                                HStack {
                                    
                                    Circle()
                                        .stroke(.white, lineWidth: 1)
                                        .frame(width: 20, height: 20)
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                }
                                .padding(1)
                                
                                Rectangle()
                                    .fill(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddGoal ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddGoal = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddGoal = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Add a goal")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Goal")
                        .foregroundColor(.black)
                        .font(.system(size: 11, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Title")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addingGoal.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addingGoal)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
                    
                    Button(action: {
                        
                        viewModel.goals.append(viewModel.addingGoal)
                        
                        viewModel.addingGoal = ""
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddGoal = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddGoal = false
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
                .offset(y: viewModel.isAddGoal ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    GoalsView()
}
