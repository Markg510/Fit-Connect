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
    
    enum Goal: String, CaseIterable, Hashable {
        case weightLoss = "Weight Loss"
        case buildMuscle = "Build Muscle", strength
        case generalFitness = "General Fitness"
    }
    
    enum FitnessLevel: CaseIterable, Hashable {
        case beginner, intermediate, advanced
    }
    
    enum PreferredTraining: CaseIterable, Hashable {
        case gym, home, outdoor
    }
    
    enum DropdownOptions {
        case gender, goal, fitnessLevel, preferredTraining
    }
    
    @State private var age = ""
    @State private var gender: Gender? = nil
    @State private var weight = ""
    @State private var height = ""
    @State private var openDropdownMenu: DropdownOptions? = nil
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
                    .foregroundStyle(.textSecondary)
                    .padding(.bottom)
                
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
                        .padding(.bottom)
                }
                
                HStack {
                    AppTextField(text: $age, placeholder: "16", label: "Age")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    DropdownMenu(showOptions: $showGenderOptions, selected: $gender, label: "Gender") { request in
                        if openDropdownMenu == nil && request == .open {
                            openDropdownMenu = .gender
                            showGenderOptions = true
                        } else {
                            if request == .open {
                                switch openDropdownMenu! {
                                case .gender:
                                    break
                                case .goal:
                                    showGoalOptions = false
                                    showGenderOptions = true
                                case .fitnessLevel:
                                    showFitnessLevelOptions = false
                                    showGenderOptions = true
                                case .preferredTraining:
                                    showPreferredTraining = false
                                    showGenderOptions = true
                                }
                                
                                openDropdownMenu = .gender
                            } else {
                                openDropdownMenu = nil
                                showGenderOptions = false
                            }
                        }
                    }
                }.padding(.bottom)
                
                HStack {
                    AppTextField(text: $weight, placeholder: "91", label: "Weight")
                    
                    AppTextField(text: $height, placeholder: "181", label: "Height")
                }.padding(.bottom)
                    .zIndex(-100)
                
                DropdownMenu(showOptions: $showGoalOptions, selected: $goal, label: "Goal") { request in
                    if openDropdownMenu == nil && request == .open {
                        openDropdownMenu = .goal
                        showGoalOptions = true
                    } else {
                        if request == .open {
                            switch openDropdownMenu! {
                            case .gender:
                                showGenderOptions = false
                                showGoalOptions = true
                            case .goal:
                                break
                            case .fitnessLevel:
                                showFitnessLevelOptions = false
                                showGoalOptions = true
                            case .preferredTraining:
                                showPreferredTraining = false
                                showGoalOptions = true
                            }
                            
                            openDropdownMenu = .goal
                        } else {
                            openDropdownMenu = nil
                            showGoalOptions = false
                        }
                    }
                }
                
                DropdownMenu(showOptions: $showFitnessLevelOptions, selected: $fitnessLevel, label: "Current Fitness Level") { request in
                    if openDropdownMenu == nil && request == .open {
                        openDropdownMenu = .fitnessLevel
                        showFitnessLevelOptions = true
                    } else {
                        if request == .open {
                            switch openDropdownMenu! {
                            case .gender:
                                showGenderOptions = false
                                showFitnessLevelOptions = true
                            case .goal:
                                showGoalOptions = false
                                showFitnessLevelOptions = true
                            case .fitnessLevel:
                                break
                            case .preferredTraining:
                                showPreferredTraining = false
                                showFitnessLevelOptions = true
                            }
                            
                            openDropdownMenu = .fitnessLevel
                        } else {
                            openDropdownMenu = nil
                            showFitnessLevelOptions = false
                        }
                    }
                }.zIndex(-100)
                
                DropdownMenu(showOptions: $showPreferredTraining, selected: $preferredTraining, label: "Preferred Training") { request in
                    if openDropdownMenu == nil && request == .open {
                        openDropdownMenu = .preferredTraining
                        showPreferredTraining = true
                    } else {
                        if request == .open {
                            switch openDropdownMenu! {
                            case .gender:
                                showGenderOptions = false
                                showPreferredTraining = true
                            case .goal:
                                showGoalOptions = false
                                showPreferredTraining = true
                            case .fitnessLevel:
                                showFitnessLevelOptions = false
                                showPreferredTraining = true
                            case .preferredTraining:
                                break
                            }
                            
                            openDropdownMenu = .preferredTraining
                        } else {
                            openDropdownMenu = nil
                            showPreferredTraining = false
                        }
                    }
                }.zIndex(-200)
                    .padding(.bottom)
                    .padding(.bottom)
                    
                Button {
                    
                } label: {
                    Text("Create Account")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.accent.gradient, in: .rect(cornerRadius: 16))
                        .foregroundStyle(.white)
                }.padding(.bottom, 8)
                    .zIndex(-250)
            }
        }
        .padding()
            .background(.colorBackground)
    }
}

#Preview {
    ClientSignUpPart2View()
}
