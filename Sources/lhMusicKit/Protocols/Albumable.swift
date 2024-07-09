//
//  File.swift
//  
//
//  Created by Nicolas Le Gorrec on 7/6/24.
//

import MusicKit
import SwiftUI

public protocol Albumable {
    var musicId: String { get }
    var primaryColor: Color { get }
    var secondaryColor: Color { get }
    var backgroundColor: Color { get }
    var artwork: Artwork? { get }
    var title: String { get }
    var artistName: String { get }
    var releaseDate: Date? { get }
    var copyright: String? { get }
    var songables: [Songable]? { get }

    func albumWithSongs() async throws -> Albumable
}
