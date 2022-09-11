//
//  ChatMessageField.swift
//  ChatApplication
//
//  Created by Arunkumar Chandrasekar on 10/09/22.
//

import SwiftUI

struct ChatMessageField: View {
    
    @EnvironmentObject var messageManager: MessageManager
    
    @State var message: String = ""
    
    var body: some View {
        HStack {
            CustomMessageFields(placeholder: Text("Enter message.."), message: $message)
            
            Button {
                messageManager.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.accentColor)
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(50)
        .padding()
    }
}

struct ChatMessageField_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageField()
            .environmentObject(MessageManager())
    }
}

struct CustomMessageFields: View {
    var placeholder: Text
    @Binding var message: String
    var editingChanges: (Bool) -> ()  = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if message.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            
            TextField("", text: $message, onEditingChanged: editingChanges, onCommit: commit)
        }
    }
}
