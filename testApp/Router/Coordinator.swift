//
//  Coordinator.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//


import Foundation
import SwiftUI

class Coordinator: ObservableObject{
    @Published var path = NavigationPath()
    
    static let sharedHome = Coordinator()
   
    func back(){
        path.removeLast()
    }
    func removeAll(){
        path.removeLast(path.count)
    }
    
    func roomDetails(room: RoomModel){
        path.append(room)
    }

}
