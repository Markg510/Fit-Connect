//
//  ContentView.swift
//  Fit Connect
//
//  Created by Mark George on 27/08/2025.
//

import SwiftUI

struct LandingView: View {
    @State private var gvm = GeneralVM()
    
    var body: some View {
        NavigationStack(path: $gvm.navPath) {
            VStack {
                Spacer()
                
                Image(.logoWhite)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                VStack {
                    Text("Fit Connect")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Your Choice, Your Coach")
                        .font(.callout)
                        .foregroundStyle(.textTertiary)
                        .padding(.bottom)
                        .padding(.bottom)

                    Button {
                        gvm.navPath.append("Sign Up")
                    } label: {
                        Label("Create Account", systemImage: "person.crop.circle.fill")
                            .fontWeight(.medium)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.white, in: .rect(cornerRadius: 16))
                            .foregroundStyle(.colorBackground)
                    }.padding(.bottom, 8)
                    
                    Divider()
                        .overlay(.textTertiary)
                        .padding([.bottom, .horizontal], 8)
                    
                    Button {
                        
                    } label: {
                        Label("Sign in with Apple", systemImage: "apple.logo")
                            .fontWeight(.medium)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.colorBackground, in: .rect(cornerRadius: 16))
                            .foregroundStyle(.white)
                    }.padding(.bottom, 8)

                    
                    Button("Log in using Email") {
                        gvm.navPath.append("Login")
                    }.foregroundStyle(.textTertiary)
                }.padding()
                    .padding(.vertical, 8)
                    .background(.accent, in: .rect(cornerRadius: 16))
            }.padding()
                .background(.colorBackground)
                .navigationDestination(for: String.self) { str in
                    if str == "Login" {
                        LoginView()
                            .environment(gvm)
                    }else if str == "Sign Up" {
                        SignUpView()
                            .environment(gvm)
                    } else if str == "SignUpClient" {
                        ClientDetails2View()
                            .environment(gvm)
                    } else if str == "SignUpCoach1" {
                        CoachDetails2View()
                            .environment(gvm)
                    } else if str == "SignUpCoach2" {
                        CoachCertificationsView()
                            .environment(gvm)
                    } else if str == "ChooseCoach" {
                        ChooseCoachView()
                            .environment(gvm)
                    } else if str == "CoachCertification" {
                        CoachCertificationsView()
                            .environment(gvm)
                    } else if str == "ClientHome" {
                        ClientHomeView()
                            .environment(gvm)
                    } else if str == "CoachHome" {
                        CoachHomeView()
                            .environment(gvm)
                    }
                }
        }
    }
}

#Preview {
    LandingView()
    
}
