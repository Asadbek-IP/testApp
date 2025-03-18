//
//  LikeButton.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

public struct LikeButton: View {
    @State private var scale = 1.0
    @State private var opacity = 0.0
    @Binding public var isLiked: Bool
    let likeSize: CGFloat
    var action: () -> Void
    public var body: some View {
        Button(action: action, label: {
            ZStack {
                Group {
                    Image("like.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: likeSize, height: likeSize)
                       
                        .opacity(isLiked ? 1 : 0)
                        .scaleEffect(isLiked ? 1.0 : 0.1)
                        .animation(.easeOut, value: self.isLiked)
                       
                    if !isLiked {
                        Image("like")
                            .resizable()
                            .scaledToFit()
                            .frame(width: likeSize, height: likeSize)
                            .foregroundStyle(.textColorPrimary)
                    }
                    
                }
                .imageScale(.large)
                .padding(11)
                
                .overlay(
                    Group {
                        DotsView(count: 9, radius: 20, speed: 0.1, scale: self.isLiked ? 0.1 : 0.8)
                        DotsView(count: 9, radius: 25, speed: 0.2, scale: self.isLiked ? 0.1 : 0.6)
                            .rotationEffect(Angle(degrees: 20))
                    }
                    .opacity(self.opacity)
                )
                
                .background(Circle().foregroundStyle(.background))
            }
            .contentShape(Rectangle())
            .frame(width: 32, height: 32)
            
        })

        .onChange(of: self.isLiked) { isLiked in
            self.scale = 1.0
            if isLiked {
                withAnimation(.linear(duration: 0.2)) {
                    self.scale = 1.2
                    self.opacity = 1
                }
                withAnimation(.linear(duration: 0.1).delay(0.2)) {
                    self.opacity = 0
                }
            }
        }
        .scaleEffect(self.scale)
        .foregroundColor(.colorPrimary)
    }
}
struct DotsView: View {
    var count: Int = 10
    var radius: CGFloat = 30
    var speed: Double = 0.1
    var scale: CGFloat = 1.0

    var body: some View {
        ZStack {
            ForEach(0 ..< count, id: \.self) { idx in
                Circle()
                    .fill(.colorPrimary)
                    .frame(width: 10)
                    .scaleEffect(self.scale)
                    .animation(.linear(duration: self.speed), value: self.scale)
                    .offset(y: -self.radius)
                    .rotationEffect(angle(index: idx))
            }
        }
    }

    func angle(index: Int) -> Angle {
        Angle(degrees: (360 / Double(self.count)) * Double(index))
    }
}

#Preview {
    LikeButton(isLiked: .constant(false),likeSize: 16, action: {})
}
