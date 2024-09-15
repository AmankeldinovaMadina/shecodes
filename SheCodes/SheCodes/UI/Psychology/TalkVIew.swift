//
//  TalkVIew.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct TalkView: View {
    
    @State private var selectedTalk = 0 // Tracks the currently displayed event
    var talks: [Talk] = [
        Talk(topic: "Shekaralardy qoiya bil", data: "Sep 15, 14:00", location: "Astana"),
        Talk(topic: "Shekaralardy qoiya bil", data: "Sep 15, 14:00", location: "Astana"),
        Talk(topic: "Shekaralardy qoiya bil", data: "Sep 15, 14:00", location: "Astana"),
        Talk(topic: "Shekaralardy qoiya bil", data: "Sep 15, 14:00", location: "Astana"),
        Talk(topic: "Shekaralardy qoiya bil", data: "Sep 15, 14:00", location: "Astana"),
        Talk(topic: "Shekaralardy qoiya bil", data: "Sep 15, 14:00", location: "Astana")
    
    ]
    var body: some View {
        TabView(selection: $selectedTalk) {
            ForEach(0..<talks.count) { index in
                TalkCardView(talk: talks[index])
                    .tag(index) // Tag to track the current index
//                        .padding(.horizontal)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 180)
//        .padding(.horizontal)
    }
}




struct TalkCardView: View {
    var talk: Talk
    
    var body: some View {
        ZStack {
            Image("article")
                .resizable()
                .scaledToFit()
            HStack{
                VStack(alignment: .leading){
                    Text("Kel, angimeleseik!")
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text(talk.topic)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.top, 8)
                    Text("\(talk.data), \(talk.location)")
                        .font(.system(size: 14))
                    Qosylu()
                    
                }
                .foregroundColor(.white)
                Spacer()
            } .padding(.leading, 24)
        }
    }
}



struct Qosylu: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 79, height: 32)
                .foregroundColor(.white)
            Text("Qosylu")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(hex: "E256FF"))
            
        }
        
        
    }
}

#Preview {
    TalkView()
}
