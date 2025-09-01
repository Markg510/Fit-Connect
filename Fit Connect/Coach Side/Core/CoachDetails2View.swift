//
//  CoachSignUpPart2View.swift
//  Fit Connect
//
//  Created by Mark George on 01/09/2025.
//

import SwiftUI

struct CoachDetails2View: View {
    @Environment(GeneralVM.self) private var gvm
    
    enum Experience: String, CaseIterable, Hashable {
        case lessThanYear = "Less than a Year"
        case oneThreeYears = "1 to 3 Years"
        case threeFiveYears = "3 to 5 Years"
        case fivePlusYears = "5+ Years"
    }
    
    enum Speciality: String, CaseIterable, Hashable {
        case weightLoss = "Weight Loss"
        case buildMuscle = "Build Muscle", strength
        case generalFitness = "General Fitness"
    }
    
    enum DropdownOptions {
        case experience, speciality
    }
    
    // View Properties
    @State private var gymLocation = ""
    @State private var speciality: Speciality?
    @State private var experience: Experience?
    @State private var introduction = ""
    
    @State private var openDropdownMenu: DropdownOptions? = nil
    @State private var showSpecialityDropdown = false
    @State private var showExperienceDropdown = false
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                AuthenticationHeader()
                
                DropdownMenu(showOptions: $showExperienceDropdown, selected: $experience, label: "Experience") { request in
                    if openDropdownMenu == nil && request == .open {
                        openDropdownMenu = .experience
                        showExperienceDropdown = true
                    } else {
                        if request == .open {
                            switch openDropdownMenu! {
                            case .experience:
                                break
                            case .speciality:
                                showSpecialityDropdown = false
                                showExperienceDropdown = true
                            }
                            
                            openDropdownMenu = .experience
                        } else {
                            openDropdownMenu = nil
                            showExperienceDropdown = false
                        }
                    }
                }
                
                DropdownMenu(showOptions: $showSpecialityDropdown, selected: $speciality, label: "Speciality") { request in
                    if openDropdownMenu == nil && request == .open {
                        openDropdownMenu = .speciality
                        showSpecialityDropdown = true
                    } else {
                        if request == .open {
                            switch openDropdownMenu! {
                            case .experience:
                                showExperienceDropdown = false
                                showSpecialityDropdown = true
                            case .speciality:
                                break
                            }
                            
                            openDropdownMenu = .experience
                        } else {
                            openDropdownMenu = nil
                            showSpecialityDropdown = false
                        }
                    }
                }.zIndex(-100)
                
                AppTextField(text: $gymLocation, placeholder: "Port Said, Egypt", label: "Gym Location")
                    .padding(.bottom)
                    .zIndex(-200)
                
                Text("Introduction")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("That's what your client will see")
                    .foregroundStyle(.textSecondary)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField("Passionate fitness coach helping clients achieve lastaing results through personalized training", text: $gymLocation, axis: .vertical)
                    .lineLimit(1...3)
                    .padding(12)
                    .background(.colorPrimary)
                    .clipShape(.rect(cornerRadius: 16))
                    .shadow(radius: 2)
                    .padding(.bottom)
                    .padding(.bottom)
                
                Button {
                    gvm.navPath.append("SignUpCoach2")
                } label: {
                    Text("Next")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.accent.gradient, in: .rect(cornerRadius: 16))
                        .foregroundStyle(.white)
                }.padding(.bottom, 8)
                    .zIndex(-250)
            }
        }.padding()
            .background(.colorBackground)
    }
}

#Preview {
    CoachDetails2View()
        .environment(GeneralVM())
}

struct AuthenticationHeader: View {
    var isLogin = false
    
    var body: some View {
        Image(.logoWhite)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150)
            .shadow(radius: 2)
        
        Text(isLogin ? "Log In" : "Sign Up")
            .foregroundStyle(.white)
            .fontWeight(.medium)
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .center)
        
        Text("Please Enter Your Details")
            .foregroundStyle(.textSecondary)
            .padding(.bottom)
    }
}
