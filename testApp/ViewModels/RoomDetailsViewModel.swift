//
//  RoomDetailsViewModel.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

class RoomDetailsViewModel: ObservableObject {
    @Published var room: RoomDetailModel? = nil
    
    init() {
        loadRoom()
    }
    
    func loadRoom() {
        self.room = RoomDetailModel(id: 1, name: "Nexora Solutions", image: "room1", price: 23.0, isLike: true, address: "123 Main Street, Rembang, Indonesia", description: "This space is perfect for those who want to escape from everything and be alone with themselves There is a lot of sunligth here, high ceilings alone with themselves There is a lot of sunligth here, high ceilings", lat: 41.0, lng: 61.0, subImage: [RoomSubImage(id: 1, image: "room11"), RoomSubImage(id: 2, image: "room22"), RoomSubImage(id: 3, image: "room33"), RoomSubImage(id: 4, image: "room44")], rating: 4.9, maxRooms: 10, availableRooms: 8, roomItem: [RoomItem(id: 1, number: 34, images: ["room55","room66", "room77", "room88"]),RoomItem(id: 2, number: 35, images: ["room55","room66", "room77", "room88"])], roomAdditions: [RoomAddition(id: 1, name: "200 sqft", icon: "sqft"),RoomAddition(id: 2, name: "Wi-Fi", icon: "wifi"), RoomAddition(id: 3, name: "3 Rooms", icon: "room"),RoomAddition(id: 4, name: "Parking", icon: "parking")], roomOwner: RoomOwner(image: "owner", name: "Jane Cooper", phone: "+998994576678"))
    }
}
