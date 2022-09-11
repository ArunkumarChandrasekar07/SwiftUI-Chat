//
//  Extension+View.swift
//  ChatApplication
//
//  Created by Arunkumar Chandrasekar on 10/09/22.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View{
        clipShape(RoundCorner(radius: radius, corners: corners))
    }
}

struct RoundCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
