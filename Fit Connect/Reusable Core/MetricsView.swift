//
//  MetricsView.swift
//  Fit Connect
//
//  Created by Mark George on 02/09/2025.
//

import SwiftUI
import Charts

struct MetricsView: View {
    var body: some View {
        VStack {
            Text("Your Metrics")
                .font(.title)
                
            Text("Last 4 Month Metrics")
                .foregroundStyle(.textSecondary)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                ForEach(0...5, id: \.self) { i in
                    weightChart()
                }
            }
        }.padding()
            .background(.colorBackground)
    }
    
    @ViewBuilder
    func weightChart() -> some View {
        VStack(alignment: .center) {
            Chart {
                BarMark(x: .value("Inbody", "#1"), y: .value("Weight", 95))
                
                BarMark(x: .value("Inbody", "#2"), y: .value("Weight", 105))
                
                BarMark(x: .value("Inbody", "#3"), y: .value("Weight", 100))
                
                BarMark(x: .value("Inbody", "#4"), y: .value("Weight", 123))
            }.aspectRatio(contentMode: .fit)
                .foregroundStyle(.accent)
            
            Text("Weight")
                .fontWeight(.medium)
        }.padding(8)
    }
}

#Preview {
    MetricsView()
}
