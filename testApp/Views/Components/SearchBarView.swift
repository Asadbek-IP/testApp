//
//  SearchBarView.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

struct SearchBarView: View {
   
    var body: some View {
       
        HStack{
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(.myGray)
            
            Text("Search")
                .customFont(.medium, 14)
                .foregroundStyle(.myGray)
            
            Spacer()
            Image("filter")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(.colorPrimary)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 17)
        .background(RoundedRectangle(cornerRadius: 36).foregroundStyle(.backgroundLight))
        .overlay(
                RoundedRectangle(cornerRadius: 36)
                    .stroke(.border, lineWidth: 1)
            )
    }
}

#Preview {
    SearchBarView()
}
