//
//  R1.swift
//  App601
//
//  Created by IGOR on 05/06/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
                            
                VStack {
                    
                    Image("R1")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("Convenient functionality and ease of learning")
                            .foregroundColor(.black)
                            .font(.system(size: 28, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            
                            Spacer()
                            
                            Circle()
                                .fill(.black)
                                .frame(width: 8, height: 8)
                            
                            Circle()
                                .fill(.black.opacity(0.3))
                                .frame(width: 8, height: 8)
                            
                            Spacer()
                            
                            NavigationLink(destination: {
                                
                                R2()
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                Text("Next")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(width: 150, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            })
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
                .ignoresSafeArea()

        }
    }
}

#Preview {
    R1()
}
