//
//  Trying2.swift
//  Fit Connect
//
//  Created by Mark George on 31/08/2025.
//

import SwiftUI

struct DropdownMenu<T: Hashable & CaseIterable>: View {
    enum ChangeOptions { case open, close }
    // Passed Properties
    @Binding var showOptions: Bool
    @Binding var selected: T?
    var height: CGFloat = 55
    let label: String
    let requestChangeDropdown: (ChangeOptions) -> ()
    
    // View Properties
    @State private var measuredHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            Text(label)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 0) {
                // Main Button
                HStack {
                    Text(selected != nil ? String(describing: selected!).capitalized : "Select")
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(showOptions ? 180 : 0))
                }.foregroundStyle(selected == nil ? .textSecondary : .white)
                    .contentShape(.rect)
                    .zIndex(10)
                    .overlay {
                        GeometryReader { proxy in
                            Spacer()
                                .onAppear {
                                    measuredHeight = proxy.size.width
                                }
                        }
                    }
                    .onTapGesture {
                        withAnimation(.snappy) {
                            requestChangeDropdown(showOptions ? .close : .open)
                        }
                    }
                
                // Dropdown List
                if showOptions {
                    VStack {
                        ForEach(Array(T.allCases), id: \.self) { option in
                            Text(String(describing: option).capitalized)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .contentShape(.rect)
                                .foregroundStyle(selected != option ? .textSecondary : .white)
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        selected = option
                                        requestChangeDropdown(showOptions ? .close : .open)
                                    }
                                }
                            
                        }
                    }.padding(.top, 8)
                }
                
            }.padding(13)
                .background(.colorPrimary, in: .rect(cornerRadius: 16))
                .shadow(radius: 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: height == 0 ? measuredHeight : height, alignment: .top)
        }
    }
}

enum abc: Hashable, CaseIterable { case a, b, c }
enum bcd: Hashable, CaseIterable { case b, c, d }
#Preview {
    @Previewable @State var selected: abc? = nil
    @Previewable @State var open: bcd? = nil
    
    DropdownMenu(showOptions: .constant(false), selected: $selected, label: "Start") { _ in }
}
