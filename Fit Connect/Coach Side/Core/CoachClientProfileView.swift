//
//  CoachClientProfileView.swift
//  Fit Connect
//
//  Created by Mark George on 02/09/2025.
//

import SwiftUI

struct CoachClientProfileView: View {
    var body: some View {
        VStack {
            Spacer()
            
            header()
            
            details()
            
            AppButton(title: "Request Progress", img: "", priority: .low) {
                
            }.padding(.bottom, 8)
            
            Spacer()
        }.padding()
            .background(.colorBackground)
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
    func details() -> some View {
        detailItem(title: "Subscription", value: "22/30 Days")
        detailItem(title: "Plan Status", value: "Needs Update")
        detailItem(title: "Member Since", value: "December 12, 2025")
        
        Divider()
        
        detailItem(title: "Email", value: "john.doe@email.com")
        detailItem(title: "Phone Number", value: "+20 128 957 9408")
        detailItem(title: "Client Code", value: "001")
        
        detailButton(img: "chart.line.uptrend.xyaxis", title: "View Client Metrics")
        
        detailButton(img: "carrot.fill", title: "View Meal Plan")
        
        detailButton(img: "dumbbell.fill", title: "View Workout Plan")
    }
    
    // MARK: - COMPONENTS
    @ViewBuilder
    func detailItem(title: String, value: String, needsAttention: Bool = false) -> some View {
        HStack {
            Text("\(title):")
                .fontWeight(.medium)
            
            Text(value)
                .foregroundStyle(needsAttention ? .colorDestructive : .textSecondary)
            
            Spacer()
        }.padding(.top, 1)
    }
    
    @ViewBuilder
    func detailButton(img: String, title: String) -> some View {
        Divider()
        
        HStack {
            Label("\(title):", systemImage: img)
                .fontWeight(.medium)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.textSecondary)
        }.padding(.top, 8)
            .padding(.bottom, img == "dumbbell.fill" ? 20 : 0)
    }
}

#Preview {
    CoachClientProfileView()
}
