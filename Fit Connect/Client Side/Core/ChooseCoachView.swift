//
//  ChooseCoachView.swift
//  Fit Connect
//
//  Created by Mark George on 02/09/2025.
//

import SwiftUI

struct ChooseCoachView: View {
    @Environment(GeneralVM.self) private var gvm
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Text("Choose\nYour Coach")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Click to View Details")
                    .foregroundStyle(.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                coachItem(coachPic: .coach, name: "Alfonso Davies", experience: .lessThanYear, speciality: .buildMuscle)
                coachItem(coachPic: .coach, name: "Taalat Mostafa", experience: .oneThreeYears, speciality: .generalFitness)
                coachItem(coachPic: .coach, name: "Ahmed Emad", experience: .fivePlusYears, speciality: .buildMuscle)
                coachItem(coachPic: .coach, name: "Alfonso Davies", experience: .threeFiveYears, speciality: .strength)
                coachItem(coachPic: .coach, name: "Mark George", experience: .fivePlusYears, speciality: .weightLoss)
            }.padding()
                .contentMargins(5, for: .scrollIndicators)
        }.background(.colorBackground)
            .navigationTitle("Choose Coach")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - COMPONENTS
    @ViewBuilder
    func coachItem(coachPic: ImageResource, name: String, experience: CoachExperience, speciality: WorkoutTypes) -> some View {
        Button {
            gvm.navPath.append("ClientHome")
        } label: {
            HStack {
                Image(coachPic)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 105, height: 105)
                    .padding(.bottom, -12)
                
                VStack(alignment: .leading) {
                    Text("Coach \n\(name)")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Label("\(experience.rawValue) Experience", systemImage: "waveform.path.ecg")
                        .font(.footnote)
                        .foregroundStyle(.textSecondary)
                    
                    Label("\(speciality.rawValue) Specalist", systemImage: "bolt.heart")
                        .font(.footnote)
                        .foregroundStyle(.textSecondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.accent)
            }.padding(12)
                .background(.colorPrimary)
                .clipShape(.rect(cornerRadius: 16))
                .shadow(radius: 2)
        }.buttonStyle(.plain)
    }
}

#Preview {
    ChooseCoachView()
        .environment(GeneralVM())
}
