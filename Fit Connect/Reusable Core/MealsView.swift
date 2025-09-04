//
//  MealView.swift
//  Fit Connect
//
//  Created by Mark George on 03/09/2025.
//

import SwiftUI

struct MealsView: View {
    enum MealType: CaseIterable {
        case breakfast, lunch, dinner, snack
    }

    @State private var selectedMealType: MealType = .breakfast
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                Section {
                    ForEach(0...7, id: \.self) { id in
                        if id % 2 == 0 {
                            mealItem(img: .sampleMeal, name: "Eggs", description: "300g")
                        } else {
                            mealItem(img: .sampleMeal, name: "Rice", description: "100g")
                        }
                    }.padding(.horizontal)
                } header: {
                    VStack(alignment: .leading) {
                        Text("Meal Plan")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        
                        Text("\"The body achieves what the mind believes\"")
                            .font(.callout)
                            .foregroundStyle(.textSecondary)
                         
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(MealType.allCases, id: \.self) { type in
                                    mealTypeItem(type: type)
                                }
                            }
                        }.padding(.bottom)
                            .padding(.horizontal, -16)
                    }.padding([.top, .horizontal])
                        .background(.colorBackground)
                }
            }
        }.clipped()
            .background(.colorBackground)
            .navigationTitle("Workout Plan")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    func mealItem(img: ImageResource, name: String, description: String) -> some View {
        HStack {
            Image(img)
                .resizable()
                .frame(width: 100, height: 80)
                .padding([.top, .horizontal], 8)
                .background(.colorPrimary)
                .clipShape(.rect(cornerRadius: 16))
            
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.medium)
                
                Text(description)
                    .font(.callout)
                    .foregroundStyle(.textTertiary)
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func mealTypeItem(type: MealType) -> some View {
        Button {
            selectedMealType = type
        } label: {
            Text(String(describing: type).capitalized)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(selectedMealType == type ? .accent : .colorPrimary, in: .rect(cornerRadius: 16))
                .animation(.snappy, value: selectedMealType)
        }.buttonStyle(.plain)
            .padding(.leading, type == .breakfast ? 16 : 0)
            .padding(.trailing, type == .snack ? 16 : 0)
    }
}

#Preview {
    MealsView()
}
