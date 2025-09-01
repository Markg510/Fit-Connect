//
//  ContentView.swift
//  Fit Connect
//
//  Created by Mark George on 27/08/2025.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image(.logoWhite)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            
            VStack {
                Text("Fit Connect")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text("Your Choice, Your Coach")
                    .foregroundStyle(.textTertiary)
                    .padding(.bottom)
                    .padding(.bottom)

                Button {
                    
                } label: {
                    Label("Create Account", systemImage: "person.crop.circle.fill")
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.white, in: .rect(cornerRadius: 16))
                        .foregroundStyle(.colorBackground)
                }.padding(.bottom, 8)
                
                Divider()
                    .overlay(.textTertiary)
                    .padding([.bottom, .horizontal], 8)
                
                Button {
                    
                } label: {
                    Label("Sign in with Apple", systemImage: "apple.logo")
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.colorBackground, in: .rect(cornerRadius: 16))
                        .foregroundStyle(.white)
                }.padding(.bottom, 8)

                
                Button("Log in using Email") {
                    
                }.foregroundStyle(.textTertiary)
            }.padding()
                .padding(.vertical, 8)
                .background(.accent, in: .rect(cornerRadius: 16))
        }.padding()
            .background(.colorBackground)
    }
}

#Preview {
    LandingView()
}
