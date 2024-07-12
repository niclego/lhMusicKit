//
//  File.swift
//  
//
//  Created by Nicolas Le Gorrec on 7/9/24.
//

import SwiftUI

public protocol TopResultable: Sendable {
    var musicId: String { get }
    var type: String { get }
    var primaryColor: Color { get }
    var secondaryColor: Color { get }
    var backgroundColor: Color { get }
    var songable: Songable? { get }
    var albumable: Albumable? { get }
    var artistable: Artistable? { get }
}
