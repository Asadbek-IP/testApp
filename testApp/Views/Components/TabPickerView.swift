//
//  TabPickerView.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

struct TabPickerView: View {
    @Binding var selectedTab: TabPickerType
    var body: some View {
        HStack{
            TabPickerItemView(selectedTab: $selectedTab, item: .rooms, title: "List", image: "list")
            TabPickerItemView(selectedTab: $selectedTab, item: .map, title: "Map", image: "location")
        }
        .padding(5)
        .background(RoundedRectangle(cornerRadius: 36).foregroundStyle(.backgroundSecondary))
    }
}


struct TabPickerItemView: View {
    @Binding var selectedTab: TabPickerType
    let item: TabPickerType
    let title: String
    let image: String
    var body: some View {
        HStack{
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(selectedTab == item ? .textColorPrimary : .myGray)
            
            Text(title)
                .customFont(.semiBold, 14)
                .foregroundStyle(selectedTab == item ? .textColorPrimary : .myGray)
            
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 36).foregroundStyle(selectedTab == item ? .white : .clear))
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation{
                selectedTab = item
            }
        }
    }
}


#Preview {
    TabPickerView(selectedTab: .constant(.rooms))
}
