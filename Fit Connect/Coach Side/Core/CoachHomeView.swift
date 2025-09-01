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
    var body: some View {
        VStack {
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
                HStack {
                    Text("23")
                        .font(.title)
                    
                    Image(systemName: "arrow.down")
                        .font(.callout)
                        .foregroundStyle(.colorDestructive)
                }
                
                Text("Total \nClients")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.textSecondary)
                    .font(.title2)
            }
            
            Spacer()
            
            VStack {
                HStack {
                    Text("10")
                        .font(.title)
                    
                    Image(systemName: "arrow.up")
                        .font(.callout)
                        .foregroundStyle(.colorConstructive)
                }
                
                Text("New \nClients")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.textSecondary)
                    .font(.title2)
            }
            
            Spacer()
            
            VStack {
                Text("23")
                    .font(.title)
                
                Text("Total \nClients")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.textSecondary)
                    .font(.title2)
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
            Button {
                
            } label: {
                VStack {
                    Image(systemName: "dumbbell.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.accent)
                        .padding(.bottom, 4)
                    
                    Text("Workouts")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Text("Your Saved Content")
                        .foregroundStyle(.textSecondary)
                        .font(.callout)
                }.foregroundStyle(.white)
                    .padding()
                    .padding(.vertical, 7)
                    .background(.colorPrimary)
                    .clipShape(.rect(cornerRadius: 16))
                    .shadow(radius: 2)
            }
            
            Button {
                
            } label: {
                VStack {
                    Image(systemName: "carrot.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.accent)
                        .rotationEffect(.degrees(13))
                        .padding(.bottom, 4)
                    
                    Text("Workouts")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Text("Your Saved Content")
                        .foregroundStyle(.textSecondary)
                        .font(.callout)
                }.foregroundStyle(.white)
                    .padding()
                    .background(.colorPrimary)
                    .clipShape(.rect(cornerRadius: 16))
                    .shadow(radius: 2)
            }
        }.frame(height: 130)
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
}
