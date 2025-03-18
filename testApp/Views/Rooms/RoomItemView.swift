//
//  RoomItemView.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

struct RoomItemView: View {
    let room: RoomModel
    @State var isLike: Bool
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
            ZStack(alignment: .topTrailing){
                Image(room.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                LikeButton(isLiked: $isLike, likeSize: 16, action: {
                    isLike.toggle()
                })
                .padding(10)
                
                
            }
            
            
            HStack{
                Text(room.name)
                    .customFont(.medium, 18)
                
                Spacer()
                
                Text(amount: room.price)
                    .customFont(.semiBold, 22)
            }
            .padding(.top, 16)
            
            HStack{
                Image("location")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .foregroundStyle(.textColorSecondary)
                
                Text(room.address)
                    .customFont(.regular, 14)
                    .foregroundStyle(.textColorSecondary)
                
            }
            .padding(.top, 8)
            
            
        }
        .padding([.top, .horizontal], 10)
        .padding(.bottom, 20)
       
        .background(RoundedRectangle(cornerRadius: 16).shadow(color: Color.black.opacity(0.04), radius: 10, x: 0, y: 0).foregroundStyle(.background))
        .padding(.top)
        
    }
}

//#Preview {
//    RoomItemView(room:  RoomModel(id: 1, name: "Nexora Solutions", image: "room1", price: 23.0, isLike: false, address: "123 Main Street, Rembang, Indonesia"), isLike: true)
//}
