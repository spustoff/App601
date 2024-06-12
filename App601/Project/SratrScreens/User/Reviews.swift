//
//  Reviews.swift
//  App601
//
//  Created by IGOR on 05/06/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
                            
                VStack {
                    
                    Image("Reviews")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("Rate our app in the AppStore")
                            .foregroundColor(.black)
                            .font(.system(size: 28, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            
                            Spacer()
                            
                            Circle()
                                .fill(.black.opacity(0.3))
                                .frame(width: 8, height: 8)
                            
                            Circle()
                                .fill(.black)
                                .frame(width: 8, height: 8)

                            Spacer()
                            
                            NavigationLink(destination: {
                                
                                Not()
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
                    .frame(height: 200)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
                .ignoresSafeArea()

        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
