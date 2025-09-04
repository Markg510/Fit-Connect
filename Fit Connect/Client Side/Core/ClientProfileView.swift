//
//  ClientProfileView.swift
//  Fit Connect
//
//  Created by Mark George on 04/09/2025.
//

import SwiftUI

struct ClientProfileView: View {
    @State private var showMetricsSheet = false
    
    var body: some View {
        VStack {
            Spacer()
            
            header()
            
            details()
            
            Spacer()
        }.padding()
            .background(.colorBackground)
            .sheet(isPresented: $showMetricsSheet) {
                MetricsView()
            }.navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - SUB VIEWS
    
    @ViewBuilder
    func header() -> some View {
        Image(.coach2)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 125)
            .padding([.horizontal, .top])
            .background(.accent)
            .clipShape(.circle)
        
        Text("Mark George")
            .font(.title2)
            .fontWeight(.medium)
        
        Text("12 Years Old | Male")
            .foregroundStyle(.textSecondary)
            .font(.callout)
            .padding(.bottom)
    }
    
    @ViewBuilder
    private func details() -> some View {
        detailItem(title: "Subscription", value: "22/30 Days")
        detailItem(title: "Member Since", value: "December 12, 2025")
        
        Divider()
        
        detailItem(title: "Coach", value: "Alfonso Davies")
        detailItem(title: "Client Code", value: "001")
        
        detailButton(img: "i.circle", title: "Terms and Conditions") {
            
        }
        
        detailButton(img: "shield", title: "Help & Support") {}
        
        detailButton(img: "rectangle.portrait.and.arrow.right", title: "Sign Out") {}
        
        detailButton(img: "trash", title: "Delete Account", isDestructive: true) {}
    }
    
    // MARK: - COMPONENTS
    @ViewBuilder
    private func detailItem(title: String, value: String, needsAttention: Bool = false) -> some View {
        HStack {
            Text("\(title):")
                .fontWeight(.medium)
            
            Text(value)
                .foregroundStyle(needsAttention ? .colorDestructive : .textSecondary)
            
            Spacer()
        }.padding(.top, 1)
    }
    
    @ViewBuilder
    private func detailButton(
        img: String,
        title: String,
        isDestructive: Bool = false,
        onPressed: @escaping () -> Void
    ) -> some View {
        Divider()
        
        Button(action: {
            onPressed()
        }) {
            HStack {
                Label("\(title)", systemImage: img)
                    .fontWeight(.medium)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.textSecondary)
            }.foregroundStyle(isDestructive ? .colorDestructive : .white)

        }
        .padding(.top, 8)
        .padding(.bottom, img == "dumbbell.fill" ? 20 : 0)
        .contentShape(.rect)
        .buttonStyle(.plain)
    }
}

#Preview {
    ClientProfileView()
}
