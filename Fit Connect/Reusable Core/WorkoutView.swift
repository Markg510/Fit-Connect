//
//  WorkoutView.swift
//  Fit Connect
//
//  Created by Mark George on 03/09/2025.
//

import SwiftUI

struct WorkoutView: View {
    @State private var selectedDay = 1
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                Section {
                    ForEach(0...7, id: \.self) { id in
                        workoutItem()
                    }.padding(.horizontal)
                } header: {
                    VStack(alignment: .leading) {
                        Text("Workout Plan")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        
                        Text("\"The body achieves what the mind believes\"")
                            .font(.callout)
                            .foregroundStyle(.textSecondary)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(1...5, id:\.self) { i in
                                    dayItem(day: i)
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
    func workoutItem() -> some View {
        HStack {
            Image(.workoutExample)
                .resizable()
                .frame(width: 100, height: 80)
                .padding([.top, .horizontal], 8)
                .background(.colorPrimary)
                .clipShape(.rect(cornerRadius: 16))
            
            VStack(alignment: .leading) {
                Text("Machine Should Press")
                    .fontWeight(.medium)
                
                Text("3x8")
                    .font(.callout)
                    .foregroundStyle(.textTertiary)
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func dayItem(day: Int) -> some View {
        Button {
            selectedDay = day
        } label: {
            Text("Day \(day)")
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(selectedDay == day ? .accent : .colorPrimary)
                .clipShape(.rect(cornerRadius: 16))
                .animation(.snappy, value: selectedDay)
        }.buttonStyle(.plain)
            .padding(.leading, day == 1 ? 16 : 0)
            .padding(.trailing, day == 5 ? 16 : 0)
    }
}

#Preview {
    WorkoutView()
}
