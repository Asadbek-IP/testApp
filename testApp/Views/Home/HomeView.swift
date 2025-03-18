//
//  HomeView.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var coordinator: Coordinator = Coordinator.sharedHome
    @State var selectedTab: TabPickerType = .rooms
    @StateObject var roomsViewModel: RoomsViewModel = RoomsViewModel()
    var body: some View {
        NavigationStack(path: $coordinator.path){
            
            ZStack(alignment: .top){
                
                
                ZStack{
                    switch selectedTab {
                    case .rooms:
                        RoomsView()
                            .environmentObject(coordinator)
                            .environmentObject(roomsViewModel)
                            
                    case .map:
                        MapView()
                            .environmentObject(coordinator)
                            .environmentObject(roomsViewModel)
                            .toolbar(.hidden)
                        
                    }
                }
                .animation(nil, value: selectedTab)
                
                HomeTopView(selectedTab: $selectedTab)
                
              
            }
            
            
            .navigationDestination(for: RoomModel.self){ room in
                
                RoomDetailsView(room: room)
                    .environmentObject(coordinator)
                    .toolbar(.hidden)
                
            }
            
            .ignoresSafeArea()
            
           
            
            
        }
    }
}

#Preview {
    HomeView()
}
