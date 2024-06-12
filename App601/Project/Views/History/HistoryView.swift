//
//  HistoryView.swift
//  App601
//
//  Created by IGOR on 05/06/2024.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var viewModel = RecordingViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("History")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Spacer()
                    
                    ZStack {

                        Circle()
                            .stroke(Color.gray.opacity(0.5), lineWidth: 15)
                            .frame(width: 60)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(calculatePercentage() / 100))
                            .stroke(Color("prim"), lineWidth: 15)
                            .frame(width: 60)
                            .rotationEffect(.degrees(-90))

                    }
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("\(viewModel.vic)/\(viewModel.def)")
                            .foregroundColor(.black)
                            .font(.system(size: 22, weight: .semibold))
                     
                        HStack {
                            
                            Circle()
                                .fill(Color("prim"))
                                .frame(width: 8, height: 8)
                            
                            Text("Victory")
                                .foregroundColor(.black)
                                .font(.system(size: 12, weight: .regular))
                            
                            Circle()
                                .fill(.gray)
                                .frame(width: 8, height: 8)
                            
                            Text("Defeat")
                                .foregroundColor(.black)
                                .font(.system(size: 12, weight: .regular))
                        }
                    }
                    
                    Spacer()

                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 110)
                .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                
                HStack {
                    
                    ForEach(viewModel.results, id: \.self) { index in
                    
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.currentResult = index
                                viewModel.fetchHistories()
                                
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 13) {
                        
                        ForEach(viewModel.histories, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedHistory = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 12) {
                                        
                                        Text(index.hisType ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                     
                                        Text(index.hisChamp ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "arrow.up.right")
                                        .foregroundColor((index.hisResult ?? "" ) == "Victory" ? .green : .red)
                                        .font(.system(size: 18, weight: .medium))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                .shadow(color: .black.opacity(0.3), radius: 5, y: 10)
                            })
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchHistories()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            HisDetail(viewModel: viewModel)
        })
    }
    
    func calculatePercentage() -> Double {
        
        let value = Int(viewModel.vic)
        let maxValue = Int(viewModel.allGames)
        
        let percentCircle = (Double(value) / Double(maxValue)) * 100
        
        return percentCircle
    }
}

#Preview {
    HistoryView()
}
