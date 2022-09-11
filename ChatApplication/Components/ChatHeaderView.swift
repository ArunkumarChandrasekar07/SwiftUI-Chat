//
//  ChatHeaderView.swift
//  ChatApplication
//
//  Created by Arunkumar Chandrasekar on 10/09/22.
//

import SwiftUI

struct ChatHeaderView: View {
    
    @State var imageUrl: URL
    @State var userName: String
    @State var userStatus: String
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(userName)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(userStatus)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                print("Call Button Tapped")
            } label: {
                Image(systemName: "phone.fill")
                    .padding()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .background(.gray)
                    .cornerRadius(50)
                    
            }
        }
        .padding()
    }
}

struct ChatHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHeaderView(imageUrl: URL(string: "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60")!, userName: "Arun kumar", userStatus: "Online")
    }
}
