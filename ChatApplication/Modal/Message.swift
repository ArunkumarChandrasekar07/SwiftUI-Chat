//
//  Message.swift
//  ChatApplication
//
//  Created by Arunkumar Chandrasekar on 10/09/22.
//

import Foundation
import SwiftUI

struct Message: Identifiable, Codable, Hashable {
    var id: String
    var message: String
    var received: Bool
    var timeStamp: Date
}
