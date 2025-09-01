//
//  CoachSignUpPart3View.swift
//  Fit Connect
//
//  Created by Mark George on 01/09/2025.
//

import SwiftUI

struct CoachCertificationsView: View {
    @Environment(GeneralVM.self) private var gvm
    
    @State private var certificate1Name = ""
    
    var body: some View {
        VStack {
            AuthenticationHeader()
            
            certificateItem(text: $certificate1Name, placeholder: "Global Fitness Association", label: "Certificate 1")
            
            certificateItem(text: $certificate1Name, placeholder: "Global Fitness Association", label: "Certificate 2")
            
            certificateItem(text: $certificate1Name, placeholder: "Global Fitness Association", label: "Certificate 3")
            
            Button {
                
            } label: {
                Text("Add Another Certificate")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.accent.gradient, in: .rect(cornerRadius: 16))
                    .foregroundStyle(.white)
            }.padding(.bottom, 8)
                .padding(.top)
                .padding(.top)
            
            Button {
                
            } label: {
                Text("Create Account")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.colorPrimary, in: .rect(cornerRadius: 16))
                    .foregroundStyle(.white)
            }.padding(.bottom, 8)
            
        }.padding()
            .background(.colorBackground)
        
        
    }
    
    @ViewBuilder
    func certificateItem(text: Binding<String>, placeholder: String, label: String) -> some View {
        AppTextField(text: text, placeholder: placeholder, label: label)
        
        Button("Upload Image") {
            
        }.frame(maxWidth: .infinity, alignment: .trailing)
            .foregroundStyle(.textSecondary)
            .font(.callout)
            .padding([.top, .trailing], 5)
    }
}

#Preview {
    CoachCertificationsView()
        .environment(GeneralVM())
}
