//
//  HomeTopView.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

struct HomeTopView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Binding var selectedTab: TabPickerType
    
    var body: some View {
        VStack(spacing: 16){
            HStack{
                SearchBarView()
                Button(action: {}, label: {
                    ZStack(alignment: .topTrailing){
                        Image("notification")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.textColorPrimary)
                        Circle()
                            .frame(width: 8, height: 8)
                            .offset(x: -2,y: -2)
                            .foregroundStyle(.myRed)
                        
                        
                    }
                    .padding(12)
                    .background(Circle().foregroundStyle(.backgroundLight))
                    .overlay(
                        Circle()
                                .stroke(.border, lineWidth: 1)
                        )
                })
            }
            
            TabPickerView(selectedTab: $selectedTab)
            
           
        }
        .padding([.horizontal, .bottom], 20)
        .padding(.top, 12)
        .padding(.top, safeAreaInsets.top)
        .background(Rectangle().foregroundStyle(.background).clipShape(.rect(bottomLeadingRadius: 30, bottomTrailingRadius: 30))
           .shadow(color: Color.black.opacity(0.04), radius: 54, x: 0, y: 16)
        )
       
        
    }
}

#Preview {
    HomeTopView(selectedTab: .constant(.rooms))
}
