//
//  SignupView.swift
//  Fit Connect
//
//  Created by Mark George on 27/08/2025.
//

import SwiftUI

struct SignUpView: View {
    enum Roles {
        case client, coach
    }
    
    @State private var email = ""
    @State private var name = ""
    @State private var number = ""
    @State private var role: Roles = .client
    @State private var password = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(.logoWhite)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .shadow(radius: 2)
                
                Text("Sign Up")
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Please Enter Your Details")
                    .foregroundStyle(.textTertiary)
                    .padding(.bottom)
                
                AppTextField(text: $email, placeholder: "\("account@email.com")", label: "Email")
                    .padding(.bottom)
                
                AppTextField(text: $name, placeholder: "John Doe", label: "Name")
                    .padding(.bottom)
                
                AppTextField(text: $number, placeholder: "01234567890", label: "Phone Number")
                    .padding(.bottom)
                
                AppTextField(text: $name, placeholder: "John Doe", label: "Name")
                    .padding(.bottom)
                
                AppTextField(text: $password, placeholder: "**********", isSecure: true, label: "Password")
                    .padding(.bottom)
                    .padding(.bottom, 8)
                
                AppTextField(text: $password, placeholder: "**********", isSecure: true, label: "Confirm Password")
                    .padding(.bottom)
                    .padding(.bottom, 8)
                
                Button {
                    
                } label: {
                    Text("Next")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.accent, in: .rect(cornerRadius: 16))
                        .foregroundStyle(.white)
                }.padding(.bottom, 8)
                
                
                    .background(.colorPrimary, in: .rect(cornerRadius: 16))
            }
        }
        .padding()
            .background(.colorBackground)
    }
}

#Preview {
    SignUpView()
    
}

