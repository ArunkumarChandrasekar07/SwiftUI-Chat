//
//  ChatBubble.swift
//  ChatApplication
//
//  Created by Arunkumar Chandrasekar on 10/09/22.
//

import SwiftUI

struct ChatBubble: View {
    
    var message: Message
    
    var senderImage: URL
    
    @State var showTime: Bool = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack(alignment: .top, spacing: 10) {
                
                if message.received {
                    
                    AsyncImage(url: senderImage) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .cornerRadius(30)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text(message.message)
                    .padding()
                    .font(.body.bold())
                    .background(message.received ? Color.red.opacity(0.7) : Color.yellow.opacity(0.7))
                    .cornerRadius(30)
                    
            }
            .frame(maxWidth: UIScreen.main.bounds.width * (message.received ? 0.9 : 0.8), alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                withAnimation {
                    Text("\(message.timeStamp.formatted(.dateTime.hour().minute()))")
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(message.received ? .leading : .trailing, message.received ? 50 : 10)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(message: .init(id: "1", message: "Hello There, This is the demo app for the chatUI", received: true, timeStamp: Date()), senderImage: URL(string: "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60")!)
    }
}
