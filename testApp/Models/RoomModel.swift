//
//  RoomModel.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

struct RoomModel: Identifiable, Hashable {
    let id: Int
    let name: String
    let image: String
    let price: Double
    var isLike: Bool
    let address: String
    let lat: Double
    let lon: Double
}

struct RoomDetailModel: Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: Double
    var isLike: Bool
    let address: String
    let description: String
    let lat: Double
    let lng: Double
    let subImage: [RoomSubImage]
    let rating: Double
    let maxRooms: Int
    let availableRooms: Int
    let roomItem: [RoomItem]
    let roomAdditions: [RoomAddition]
    let roomOwner: RoomOwner
}

struct RoomSubImage: Identifiable {
    let id: Int
    let image: String
}

struct RoomItem: Identifiable, Hashable {
    let id: Int
    let number: Int
    let images: [String]
}

struct RoomAddition: Identifiable {
    let id: Int
    let name: String
    let icon: String
}

struct RoomOwner {
    let image: String
    let name: String
    let phone: String
}
