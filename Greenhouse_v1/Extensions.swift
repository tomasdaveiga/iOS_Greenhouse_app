//
//  Extensions.swift
//  Greenhouse_v1
//
//  Created by Tomás Veiga on 05/05/2023.
//

import Foundation
import UIKit
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension Int {
    func roundInt() -> String {
        return String(format: "%d", self)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func cornerOutLine(_ radius: CGFloat, corners: UIRectCorner) -> some View{
        overlay(RoundedCorner(radius: radius, corners: corners).stroke(.gray, lineWidth: 4))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
