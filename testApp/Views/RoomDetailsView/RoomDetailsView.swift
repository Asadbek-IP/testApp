//
//  HomeDetailsView.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI
import MapKit

struct RoomDetailsView: View {
    let room: RoomModel
    @StateObject var viewModel: RoomDetailsViewModel = RoomDetailsViewModel()
    @EnvironmentObject var coordinator: Coordinator
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.0, longitude: 61.0),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    var body: some View {
        
        if viewModel.room != nil {
            VStack(alignment: .leading){
                RoomDeatailsTopBar(back: {
                    coordinator.back()
                })
                
                ScrollView(showsIndicators: false) {
                    VStack{
                        ZStack(alignment: .topTrailing){
                            Image(room.image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            LikeButton(isLiked: .constant(true), likeSize: 20, action: {
                                //isLike.toggle()
                            })
                            .padding(10)
                            
                            
                        }
                        
                        HStack{
                            ForEach(viewModel.room!.subImage, id: \.id){ image in
                                
                                
                                    Image(image.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity)
                                
                                
                            }
                        }
                        
                        HStack{
                            Text(room.name)
                                .customFont(.semiBold, 20)
                            Spacer()
                            Text(amount: room.price)
                                .customFont(.semiBold, 20)
                        }
                        .padding(.top, 8)
                        
                        HStack{
                            Image("location")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                                .foregroundStyle(.textColorSecondary)
                            
                            Text(room.address)
                                .customFont(.regular, 14)
                                .foregroundStyle(.textColorSecondary)
                            
                            Spacer()
                        }
                        
                        HStack{
                            if let rating = viewModel.room?.rating {
                                ForEach(0...Int(rating), id: \.self) { i in
                                    Image("star")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                }
                            }
                            
                            Text(String(format: "%.1f", viewModel.room?.rating ?? 0.0))
                                .customFont(.medium, 14)
                            Spacer()
                        }
                        
                        
                        HStack{
                            Text("Available Rooms")
                                .customFont(.semiBold, 16)
                            
                            Spacer()
                            
                            Text("\(viewModel.room!.availableRooms)/\(viewModel.room!.maxRooms) Rooms")
                                .customFont(.regular, 13)
                            
                            
                        }
                        .padding(.top, 8)
                        
                        
                        ForEach(viewModel.room!.roomItem, id: \.id){ item in
                            
                            availableRooms(item: item)
                            
                        }
                        
                        HStack(spacing: 12){
                            ForEach(viewModel.room!.roomAdditions, id: \.id){ item in
                                
                                VStack{
                                    Image(item.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                        .foregroundStyle(.myGray)
                                    
                                    Text(item.name)
                                        .customFont(.regular, 14)
                                        .foregroundStyle(.myGray)
                                    
                                }
                                
                                
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                    .stroke(.border, lineWidth: 1)
                            )
                        .padding(.top)
                        
                        
                        Text("Description")
                            .customFont(.semiBold, 16)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        ReadMoreText(text: viewModel.room!.description, lineLimit: 3)
                            .padding(.top, 2)
                        
                        HStack{
                            Image(viewModel.room!.roomOwner.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 56, height: 56)
                            
                            VStack(alignment: .leading){
                                Text(viewModel.room!.roomOwner.name)
                                    .customFont(.bold, 18)
                                Text("Owner")
                                    .customFont(.regular, 14)
                            }
                            
                            Spacer()
                            
                            Image("chat")
                                .resizable()
                                .scaledToFit()
                                .frame(width:16, height: 16)
                                .padding(12)
                                .foregroundStyle(.colorPrimary)
                                .background(Circle().foregroundStyle(.background).overlay(
                                    Circle()
                                            .stroke(.border, lineWidth: 1)
                                    ))
                            
                            Image("call")
                                .resizable()
                                .scaledToFit()
                                .frame(width:16, height: 16)
                                .padding(12)
                                .foregroundStyle(.colorPrimary)
                                .background(Circle().foregroundStyle(.background).overlay(
                                    Circle()
                                            .stroke(.border, lineWidth: 1)
                                    ))
                        }
                        .padding(.top, 8)
                        
                        HStack{
                            Text("See on maps")
                                .customFont(.bold, 16)
                            Spacer()
                            
                            Image("arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width:20, height: 20)
                            
                        }
                        .padding(.top, 8)
                        
                        Map(coordinateRegion: $region)
                                    .overlay(
                                        Image("maplocation")
                                            .frame(width: 30, height: 30)
                                            .position(x: 60, y: 60)
                                    )
                                    .frame(height: 120)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Button(action: {}, label: {
                            Text("Get Direction")
                                .customFont(.bold, 16)
                                .foregroundStyle(.white)
                                .padding(14)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundStyle(.colorPrimary))
                        })
                        .padding(.top, 8)
                        
                    }
                    .padding()
                }
            }
            
           
        }
        
    }
    
    @ViewBuilder
    func availableRooms(item: RoomItem) -> some View {
        VStack(alignment: .leading){
            Text("Room N.\(item.number)")
                .customFont(.medium, 13)
            
            HStack{
                ForEach(item.images, id:\.self){ image in
                    
                    
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    
                }
            }
        }
        .padding(.top, 6)
        
    }
}

struct ReadMoreText: View {
    let text: String
    let lineLimit: Int
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .customFont(.regular, 13)
                .lineLimit(isExpanded ? nil : lineLimit)
                .animation(.easeInOut, value: isExpanded)

            Button(action: {
                isExpanded.toggle()
            }) {
                Text(isExpanded ? "Show Less" : "more")
                    .customFont(.regular, 13)
                    
                    .foregroundColor(.blue)
            }
        }
    }
}

//#Preview {
//    RoomDetailsView(room:  RoomModel(id: 1, name: "Nexora Solutions", image: "room1", price: 23.0, isLike: false, address: "123 Main Street, Rembang, Indonesia"))
//}
