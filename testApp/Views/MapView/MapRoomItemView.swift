//
//  MapRoomItemView.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

struct MapRoomItemView: View {
    let room: RoomModel
    let onTap: () -> Void
    var body: some View {
        HStack{
            Image(room.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 94, height: 88)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 8){
                Text(room.name)
                    .customFont(.medium, 16)
                HStack{
                    Image("location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundStyle(.myGray)
                    Text(room.address)
                        .customFont(.regular, 14)
                        .foregroundStyle(.myGray)
                        .lineLimit(1)
                }
                
                Text(amount: room.price)
                    .customFont(.bold, 16)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 16).foregroundStyle(.background))
        .padding()
        .onTapGesture {
            onTap()
        }
    }
}

//#Preview {
//    MapRoomItemView(room: RoomModel(id: 1, name: "Nexora Solutions", image: "room1", price: 23.0, isLike: false, address: "123 Main Street, Rembang, Indonesia", lat: 41.318697, lon: 69.270588))
//}
