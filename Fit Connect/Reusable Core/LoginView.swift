//
//  LoginView.swift
//  Fit Connect
//
//  Created by Mark George on 27/08/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Image(.logoWhite)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .shadow(radius: 2)
                
                Text("Log In")
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Enter your email and password")
                    .foregroundStyle(.textTertiary)
                    .padding(.bottom)
                
                AppTextField(text: $email, placeholder: "\("account@email.com")", label: "Email")
                    .padding(.bottom)
                
                AppTextField(text: $password, placeholder: "**********", isSecure: true, label: "Password")
                    .padding(.bottom)
                    .padding(.bottom, 8)
                
                Button {
                    
                } label: {
                    Text("Log In")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.colorBackground, in: .rect(cornerRadius: 16))
                        .foregroundStyle(.white)
                }.padding(.bottom, 8)
                
                Text("Forgot Password")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 8)
                    .padding(.bottom)
            }.padding()
                .background(.accent, in: .rect(cornerRadius: 16))
            
            Spacer()
        }.padding()
            .background(.colorBackground)
    }
}

#Preview {
    LoginView()
}
