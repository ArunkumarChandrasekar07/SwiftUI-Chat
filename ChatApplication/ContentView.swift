//
//  ContentView.swift
//  ChatApplication
//
//  Created by Arunkumar Chandrasekar on 10/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var messageManager = MessageManager()
    
//    var messageArray: [Message] = [
//        .init(id: "1", message: "Hello There, This is the demo app for the chatUI", received: true, timeStamp: Date()),
//        .init(id: "2", message: "Hi There, How is it going!!", received: false, timeStamp: Date()),
//        .init(id: "3", message: "SwiftUI is awesome, you can surely enjoy it to the core!", received: true, timeStamp: Date()),
//        .init(id: "4", message: "Sounds Great!! 🎉 How about the designs and everything? Looks Smooth and Clean??", received: false, timeStamp: Date()),
//        .init(id: "5", message: "Design using SwiftUI is awesome and beautiful. This will be the future for the iOS Development", received: true, timeStamp: Date()),
//        .init(id: "6", message: "Fantastic!! Looking forward to!! ", received: false, timeStamp: Date()),
//        .init(id: "6", message: "Congratulations and wish you all the best for the future enhancements!! ", received: false, timeStamp: Date())
//    ]
    
    var body: some View {
        VStack {
            VStack {
                ChatHeaderView(imageUrl: URL(string: "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60")!, userName: "Arun kumar", userStatus: "Online")
                
                ScrollViewReader { scroll in
                    ScrollView {
                        ForEach(messageManager.messages, id: \.self) { message in
                            ChatBubble(message: message, senderImage: URL(string: "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60")!)
                        }
                        .padding(.top, 10)
                    }
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .onChange(of: messageManager.lastMessageId) { newValue in
                        withAnimation {
                            scroll.scrollTo(newValue, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color.yellow)
            
            ChatMessageField()
                .environmentObject(messageManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
