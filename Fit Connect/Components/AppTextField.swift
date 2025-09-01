//
//  AppTextField.swift
//  Fit Connect
//
//  Created by Mark George on 27/08/2025.
//

import SwiftUI

struct AppTextField: View {
    @Binding var text: String
    let placeholder: String
    var isSecure: Bool = false
    let label: String
    
    var body: some View {
        VStack {
            Text(label)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding(12)
                    .shadow(radius: 2)
            } else {
                TextField(placeholder, text: $text)
                    .padding(12)
                    .background(.colorPrimary, in: .rect(cornerRadius: 16))
                    .shadow(radius: 2)
            }
        }
    }
}

#Preview {
    AppTextField(text: .constant(""), placeholder: "sample text", label: "Email")
        .padding()
        .background(.colorPrimary)
}
