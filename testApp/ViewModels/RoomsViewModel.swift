//
//  RoomsViewModel.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

class RoomsViewModel: ObservableObject {
    @Published var rooms: [RoomModel] = []
    @Published var selectRoom: RoomModel? = nil
    
    init() {
        loadRooms()
    }
    
    func loadRooms() {
        self.rooms = [
            RoomModel(id: 1, name: "Nexora Solutions", image: "room1", price: 23.0, isLike: false, address: "123 Main Street, Rembang, Indonesia", lat: 41.318697, lon: 69.270588),
            RoomModel(id: 2, name: "Nexora Solutions2", image: "room2", price: 40.0, isLike: false, address: "124 Main Street, Rembang, Indonesia", lat: 41.322010, lon: 69.271984)
        ]
        
        selectRoom = rooms.first
    }
}
