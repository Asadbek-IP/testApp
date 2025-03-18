//
//  RoomDeatailsTopBar.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

struct RoomDeatailsTopBar: View {
    let back: () -> Void
    var body: some View {
        HStack{
            Button(action: back, label: {
                Image("back")
                    .resizable()
                    .scaledToFit()
                    .frame(width:20, height: 20)
                    .padding(12)
                    .foregroundStyle(.textColorPrimary)
                    .background(Circle().foregroundStyle(.background).overlay(
                        Circle()
                                .stroke(.border, lineWidth: 1)
                        ))
               
            })
            
            
            Spacer()
            
            Image("help")
                .resizable()
                .scaledToFit()
                .frame(width:20, height: 20)
                .padding(12)
                .foregroundStyle(.textColorPrimary)
                .background(Circle().foregroundStyle(.background).overlay(
                    Circle()
                            .stroke(.border, lineWidth: 1)
                    ))
        }
        .padding(.horizontal)
    }
}

#Preview {
    RoomDeatailsTopBar(back: {})
}
