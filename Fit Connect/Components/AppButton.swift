//
//  AppButton.swift
//  Fit Connect
//
//  Created by Mark George on 02/09/2025.
//

import SwiftUI

struct AppButton: View {
    enum Priority { case high, low }
    
    let title: String
    let img: String
    let priority: Priority
    let onPressed: () -> ()
    
    var body: some View {
        Button {
           onPressed()
        } label: {
            Label(title, systemImage: img)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(priority == .high ? .accent : .colorPrimary)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 16))
                .shadow(radius: 2)
        }
    }
}

#Preview {
    AppButton(title: "Create Account", img: "person.fill", priority: .high) {}
}
