//
//  LoginView.swift
//  Fit Connect
//
//  Created by Mark George on 27/08/2025.
//

import SwiftUI

struct LoginView: View {
    @Environment(GeneralVM.self) private var gvm
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            AuthenticationHeader(isLogin: true)
            
            AppTextField(text: $email, placeholder: "\("account@email.com")", label: "Email")
                .padding(.bottom)
            
            AppTextField(text: $password, placeholder: "**********", isSecure: true, label: "Password")
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
            
            Text("Forgot Password")
                .foregroundStyle(.colorDestructive)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 8)
                .padding(.bottom)
            
            Spacer()
        }.padding()
            .background(.colorBackground)
    }
}

#Preview {
    LoginView()
        .environment(GeneralVM())
}
