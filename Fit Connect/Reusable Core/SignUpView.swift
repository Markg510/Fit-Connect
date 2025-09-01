//
//  SignupView.swift
//  Fit Connect
//
//  Created by Mark George on 27/08/2025.
//

import SwiftUI

struct SignUpView: View {
    @Environment(GeneralVM.self) private var gvm
    
    enum Roles: String, Hashable, CaseIterable {
        case client, coach
    }
    
    @State private var email = ""
    @State private var name = ""
    @State private var number = ""
    @State private var role: Roles? = nil
    @State private var password = ""
    
    @State private var showRolesOption = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                AuthenticationHeader()
                
                Text("Profile Picture")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Profile Picture")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }.padding(12)
                        .background(.colorPrimary)
                        .clipShape(.rect(cornerRadius: 16))
                        .foregroundStyle(.textSecondary)
                }
                
                AppTextField(text: $email, placeholder: "\("account@email.com")", label: "Email")
                    .padding(.bottom)
                
                AppTextField(text: $name, placeholder: "John Doe", label: "Name")
                    .padding(.bottom)
                
                AppTextField(text: $number, placeholder: "01234567890", label: "Phone Number")
                    .padding(.bottom)
                
                DropdownMenu(showOptions: $showRolesOption, selected: $role, label: "Role") { request in
                    showRolesOption = request == .open ? true : false
                }.padding(.bottom)
                
                AppTextField(text: $password, placeholder: "**********", isSecure: true, label: "Password")
                    .zIndex(-10)
                    .padding(.bottom)
                    .padding(.bottom, 8)
                
                AppTextField(text: $password, placeholder: "**********", isSecure: true, label: "Confirm Password")
                    .padding(.bottom)
                    .padding(.bottom, 8)
                
                Button {
                    gvm.navPath.append(role == .client ? "SignUpClient" : "SignUpCoach1")
                } label: {
                    Text("Next")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.accent, in: .rect(cornerRadius: 16))
                        .foregroundStyle(.white)
                }.padding(.bottom, 8)
            }
        }
        .padding()
            .background(.colorBackground)
    }
}

#Preview {
    SignUpView()
        .environment(GeneralVM())
}

