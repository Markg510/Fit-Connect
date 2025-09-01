//
//  ClientSignUpPart2View.swift
//  Fit Connect
//
//  Created by Mark George on 28/08/2025.
//

import SwiftUI

struct ClientSignUpPart2View: View {
    enum Gender: CaseIterable, Hashable {
        case male, female
    }
    
    enum Goal: CaseIterable, Hashable {
        case weightLoss, buildMuscle, strength, generalFitness
    }
    
    enum FitnessLevel: CaseIterable, Hashable {
        case beginner, intermediate, advanced
    }
    
    enum PreferredTraining: CaseIterable, Hashable {
        case gym, home, outdoor
    }
    
    enum dropdownOptions {
        case gender, goal, fitnessLevel, preferredTraining
    }
    
    @State private var age = ""
    @State private var gender: Gender? = nil
    @State private var weight = ""
    @State private var height = ""
    @State private var openDropdownMenu: dropdownOptions? = nil
    @State private var goal: Goal? = nil
    @State private var fitnessLevel: FitnessLevel? = nil
    @State private var preferredTraining: PreferredTraining? = nil
    
    // Dropdown menu showers
    @State private var showGenderOptions = false
    @State private var showGoalOptions = false
    @State private var showFitnessLevelOptions = false
    @State private var showPreferredTraining = false
    
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
                
                HStack {
                    AppTextField(text: $age, placeholder: "16", label: "Age")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    DropdownMenu(showOptions: $showGenderOptions, selected: $gender, label: "Gender")
                }.padding(.bottom)
                
                HStack {
                    AppTextField(text: $weight, placeholder: "91", label: "Weight")
                    
                    AppTextField(text: $height, placeholder: "181", label: "Height")
                }.padding(.bottom)
                    .zIndex(-100)
                
                DropdownMenu(showOptions: $showGoalOptions, selected: $goal, label: "Goal")
                
                DropdownMenu(showOptions: $showFitnessLevelOptions, selected: $fitnessLevel, label: "Current Fitness Level")
                
                DropdownMenu(showOptions: $showPreferredTraining, selected: $preferredTraining, label: "Preferred Training")
                    .padding(.bottom)
                    
                Button {
                    
                } label: {
                    Text("Create Account")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.accent.gradient, in: .rect(cornerRadius: 16))
                        .foregroundStyle(.white)
                }.padding(.bottom, 8)
            }
        }
        .padding()
            .background(.colorBackground)
    }
}

#Preview {
    ClientSignUpPart2View()
}
