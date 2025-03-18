//
//  RoomsView.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

struct RoomsView: View {
    @EnvironmentObject var roomsViewModel: RoomsViewModel
    @EnvironmentObject var coordinator: Coordinator
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var body: some View {
        
        ScrollView(showsIndicators: false){
            VStack{
                ForEach(roomsViewModel.rooms, id: \.id){ room in
                    
                    RoomItemView(room: room, isLike: room.isLike)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .contentShape(Rectangle())
                        .onTapGesture(perform: {
                            coordinator.roomDetails(room: room)
                        })
                    
                    
                }
            }
            .padding(.bottom, 64)
        }
        .padding(.horizontal)
        .padding(.top,safeAreaInsets.top + 150)
        .background(.backgroundLight)
        
        
    }
}

#Preview {
    RoomsView()
        .environmentObject(RoomsViewModel())
}
