//
//  File.swift
//  
//
//  Created by Nicolas Le Gorrec on 7/18/24.
//

import MusicKit
import SwiftUI

struct ArtistMock: Artistable {
    var musicId: String
    
    var primaryColor: Color
    
    var secondaryColor: Color
    
    var backgroundColor: Color
    
    var artwork: Artwork?
    
    var name: String
    
    var albumables: [Albumable]?
    
    var topSongables: [Songable]?
    
    func artistWithAlbums() async throws -> Artistable {
        return Self.mock
    }
    
    func artistWithTopSongs() async throws -> Artistable {
        return Self.mock
    }
}

extension ArtistMock {
    static let mock = ArtistMock(
        musicId: "12345",
        primaryColor: Color.primary,
        secondaryColor: Color.secondary,
        backgroundColor: Color.yellow,
        name: "Rick",
        albumables: [],
        topSongables: []
    )
}
