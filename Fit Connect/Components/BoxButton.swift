//
//  BoxButton.swift
//  Fit Connect
//
//  Created by Mark George on 02/09/2025.
//

import SwiftUI

struct BoxButton: View {
    let title: String
    let img: String
    let description: String
    let onPress: () -> ()
    
    var body: some View {
        Button {
            onPress()
        } label: {
            VStack {
                Image(systemName: img)
                    .font(.largeTitle)
                    .foregroundStyle(.accent)
                    .padding(.bottom, 4)
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.medium)
                
                Text(description)
                    .foregroundStyle(.textSecondary)
                    .font(.callout)
            }.foregroundStyle(.white)
                .padding()
                .padding(.vertical, 7)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 130)
                .background(.colorPrimary)
                .clipShape(.rect(cornerRadius: 16))
                .shadow(radius: 2)
        }
    }
}

#Preview {
    BoxButton(title: "Leg Day", img: "dumbbell.fill", description: "3rd Workout Day") {}
}
