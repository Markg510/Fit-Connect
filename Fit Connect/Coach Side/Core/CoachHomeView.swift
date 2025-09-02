//
//  CoachHomeView.swift
//  Fit Connect
//
//  Created by Mark George on 02/09/2025.
//

import SwiftUI

struct CoachHomeView: View {
    enum clientStatus {
        case normal, needsUpdate, new
    }
    
    @Environment(GeneralVM.self) private var gvm
    
    var body: some View {
        VStack {
            Spacer()
            
            dashboard()
            
            yourClients()
            
            savedContent()
            
            Spacer()
        }.padding()
            .background(.colorBackground)
    }
    
    /// MARK :- SUB VIEWS
    
    @ViewBuilder
    func dashboard() -> some View {
        HStack {
            VStack {
                Text("23")
                    .font(.title)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "arrow.down")
                            .font(.callout)
                            .foregroundStyle(.colorDestructive)
                            .alignmentGuide(.trailing) { $0[.leading] }
                    }
                
                Text("Total \nClients")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.textSecondary)
                    .font(.title3)
            }
            
            Spacer()
            
            VStack {
                Text("10")
                    .font(.title)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "arrow.up")
                            .font(.callout)
                            .foregroundStyle(.colorConstructive)
                            .alignmentGuide(.trailing) { $0[.leading] }
                    }
                
                Text("New \nClients")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.textSecondary)
                    .font(.title3)
            }
            
            Spacer()
            
            VStack {
                Text("23")
                    .font(.title)
                
                Text("Total \nClients")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.textSecondary)
                    .font(.title3)
            }
        }.padding()
            .background(.colorPrimary)
            .clipShape(.rect(cornerRadius: 16))
            .shadow(radius: 2)
            .padding(.bottom)
    }
    
    @ViewBuilder
    func yourClients() -> some View {
        HStack {
            Text("Your Clients")
                .font(.title2)
            
            Spacer()
            
            Button {
                
            } label: {
                HStack(alignment: .center) {
                    Text("See All")
                    
                    Image(systemName: "chevron.right")
                }.foregroundStyle(.accent)
                    .font(.callout)
            }
        }
        
        Label("Green label means new, red means needs update", systemImage: "i.circle")
            .font(.footnote)
            .foregroundStyle(.textSecondary)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        clientItem(id: "001", name: "Alfonso Davies", status: .normal)
        clientItem(id: "002", name: "Nicolas Jackson", status: .needsUpdate)
        clientItem(id: "003", name: "Mahmoud Maady", status: .normal)
        clientItem(id: "004", name: "Taalat Moustafa", status: .new)
        clientItem(id: "005", name: "Acer Predator", status: .normal)
        clientItem(id: "006", name: "Naser Eldesouky", status: .needsUpdate)
            .padding(.bottom)
    }
    
    @ViewBuilder
    func savedContent() -> some View {
        Text("Saved Content")
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        HStack {
            BoxButton(title: "Workouts", img: "dumbbell.fill", description: "Saved Workouts") {
                
            }
            
            BoxButton(title: "Meals", img: "carrot.fill", description: "Saved Meals") {
                
            }
        }
    }
    
    // MARK :- COMPONENTS
    @ViewBuilder
    func clientItem(id: String, name: String, status: clientStatus) -> some View {
        HStack {
            Text(id)
                .foregroundStyle(.textSecondary)
            
            Circle()
                .fill(status == .new ? .colorConstructive : .colorDestructive)
                .frame(width: 6, height: 6)
                .opacity(status == .normal ? 0 : 1)
                .padding(.horizontal, 8)
            
            Text(name)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.textSecondary)
        }.padding(.horizontal)
            .padding(.vertical, 8)
            .background(.colorPrimary)
            .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    CoachHomeView()
        .environment(GeneralVM())
}
