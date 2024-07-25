//
//  File.swift
//  
//
//  Created by Nicolas Le Gorrec on 7/18/24.
//

import MusicKit
import SwiftUI

struct AlbumMock: Albumable {
    var musicId: String
    
    var primaryColor: Color
    
    var secondaryColor: Color
    
    var backgroundColor: Color
    
    var artwork: Artwork?
    
    var title: String
    
    var artistName: String
    
    var releaseDateTime: Date?
    
    var copyright: String?
    
    var songables: [any Songable]?
    
    var artistables: [any Artistable]?
    
    func albumWithSongs() async throws -> Albumable {
        return AlbumMock.mock
    }
    
    func albumWithArtists() async throws -> Albumable {
        return AlbumMock.mock
    }
    
    func play() async throws {
        return
    }
}

extension AlbumMock {
    static let mock: AlbumMock = AlbumMock(
        musicId: "88",
        primaryColor: .primary,
        secondaryColor: .secondary,
        backgroundColor: .yellow,
        title: "Tumbler",
        artistName: "Rick",
        releaseDateTime: .distantPast,
        copyright: "copyright",
        songables: [],
        artistables: [ArtistMock.mock]
    )
}
