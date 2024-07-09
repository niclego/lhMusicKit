//
//  Artistable.swift
//
//
//  Created by Nicolas Le Gorrec on 7/6/24.
//

import MusicKit
import SwiftUI

public protocol Artistable {
    var musicId: String { get }
    var primaryColor: Color { get }
    var secondaryColor: Color { get }
    var backgroundColor: Color { get }
    var artwork: Artwork? { get }
    var name: String { get }
    var albumables: [Albumable]? { get }
    var topSongables: [Songable]? { get }

    func artistWithAlbums() async throws -> Artistable
    func artistWithTopSongs() async throws -> Artistable
}
