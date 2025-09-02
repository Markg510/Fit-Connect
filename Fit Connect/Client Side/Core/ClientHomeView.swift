//
//  ClientHomeView.swift
//  Fit Connect
//
//  Created by Mark George on 02/09/2025.
//

import SwiftUI

struct ClientHomeView: View {
    @Environment(GeneralVM.self) private var gvm
    
    var body: some View {
        VStack {
            Spacer()
            
            quote()
            
            todaysPlan()
            
            dailyGoals()
            
            AppButton(title: "View Profile", img: "person.fill", priority: .low) {
                
            }.padding(.bottom, 8)
            
            Spacer()
        }.padding()
            .background(.colorBackground)
    }
    
    // MARK: - SUB VIEWS
    @ViewBuilder
    func quote() -> some View {
        HStack {
            Image(.coach)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding(.bottom, -12)
                .padding(.leading, -12)
            
            VStack(alignment: .center) {
                Text("\"The Body Achieves What the Mind Believes\"")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.textTertiary)
                    .minimumScaleFactor(0.8)
                    .fontWeight(.medium)
                    .lineLimit(2)
                
                Text("~ Coach Alfonso Davies")
                    .foregroundStyle(.white)
                    .font(.footnote)
            }
        }.padding(12)
            .background(.colorPrimary)
            .clipShape(.rect(cornerRadius: 16))
            .shadow(radius: 2)
            .padding(.bottom)
    }
    
    @ViewBuilder
    func todaysPlan() -> some View {
        Text("Today's Plan")
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        HStack {
            BoxButton(title: "Leg Day", img: "dumbbell.fill", description: "3rd Workout Day") {}

            BoxButton(title: "Meal 3", img: "carrot.fill", description: "Grilled Chicken + Rice") {}
        }
            .padding(.bottom)
    }
    
    @ViewBuilder
    func dailyGoals() -> some View {
        HStack {
            Text("Daily Goals")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Button("View Metrics") {
                
            }.foregroundStyle(.accent)
                .font(.callout)
        }
        
        let circleFrame: CGFloat = 105
        HStack(alignment: .bottom) {
            Spacer()
            
            VStack {
                Text("Water")
                    .font(.headline)
                    .fontWeight(.medium)
                
                Text("1.5L")
                    .foregroundStyle(.textTertiary)
                    .font(.callout)
                
                ZStack(alignment: .center) {
                    Circle()
                        .trim(from: 0.5, to: 1)
                        .stroke(.colorBackground, lineWidth: 16)
                        .frame(width: circleFrame, height: circleFrame)
                    
                    Circle()
                        .trim(from: 0.5, to: 0.9)
                        .stroke(.colorDestructive, lineWidth: 16)
                        .frame(width: circleFrame, height: circleFrame)
                    
                    Image(systemName: "drop.fill")
                        .font(.largeTitle)
                        .padding(.bottom)
                        .foregroundStyle(.colorBackground)
                }.padding(.top)
                    .padding(.bottom, -circleFrame / 2)
            }
            
            Spacer()
            
            VStack {
                Text("Calories")
                    .font(.headline)
                    .fontWeight(.medium)
                
                Text("2320 kcal")
                    .foregroundStyle(.textTertiary)
                    .font(.callout)
                
                ZStack(alignment: .center) {
                    Circle()
                        .trim(from: 0.5, to: 1)
                        .stroke(.colorBackground, lineWidth: 16)
                        .frame(width: circleFrame, height: circleFrame)
                    
                    Circle()
                        .trim(from: 0.5, to: 0.85)
                        .stroke(.accent, lineWidth: 16)
                        .frame(width: circleFrame, height: circleFrame)
                        
                    
                    Image(systemName: "flame.fill")
                        .font(.largeTitle)
                        .padding(.bottom)
                        .foregroundStyle(.colorBackground)
                }.padding(.top)
                    .padding(.bottom, -circleFrame / 2)
            }
            
            Spacer()
        }.padding(.top)
            .background(.colorPrimary)
            .clipShape(.rect(cornerRadius: 16))
            .shadow(radius: 2)
            .padding(.bottom)
    }
}

#Preview {
    ClientHomeView()
        .environment(GeneralVM())
}
