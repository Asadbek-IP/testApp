//
//  MapView.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI
import MapKit
struct MapView: View {
    @EnvironmentObject var roomsViewModel: RoomsViewModel
    @EnvironmentObject var coordinator: Coordinator
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var body: some View {
        ZStack(alignment: .bottom){
            Map(coordinateRegion: .constant(MKCoordinateRegion(
                           center: CLLocationCoordinate2D(latitude: roomsViewModel.rooms.first?.lat ?? 41, longitude: roomsViewModel.rooms.first?.lon ?? 61),
                           span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                       )), annotationItems: roomsViewModel.rooms) { room in
                           MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: room.lat, longitude: room.lon)) {
                               Button(action: {
                                   roomsViewModel.selectRoom = room
                               }) {
                                   VStack {
                                       Text(amount: room.price)
                                           .customFont(.bold,16)
                                           .padding(.vertical, 6)
                                           .padding(.horizontal, 12)
                                           .foregroundColor(roomsViewModel.selectRoom?.id == room.id ? .white : .primary)
                                           .background(RoundedRectangle(cornerRadius: 12).fill(roomsViewModel.selectRoom?.id == room.id ? Color.blue : Color.white))
                                       Image("maplocation")
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: 24, height: 24)
                                   }
                               }
                           }
                       }
            
            MapRoomItemView(room: roomsViewModel.selectRoom!, onTap: {
                coordinator.roomDetails(room: roomsViewModel.selectRoom!)
            })
            .padding(.bottom, safeAreaInsets.bottom)
            
        }
        .ignoresSafeArea()
        
       
    }
}

#Preview {
    MapView()
        .environmentObject(RoomsViewModel())
}
