//
//  File.swift
//  
//
//  Created by Nicolas Le Gorrec on 7/18/24.
//

import MusicKit
import SwiftUI

struct SongMock: Songable {
    var musicId: String
    
    var primaryColor: Color
    
    var secondaryColor: Color
    
    var backgroundColor: Color
    
    var isReleased: Bool

    var title: String
    
    var artistName: String

    var artwork: Artwork?

    var albumTitle: String?
    
    var releaseDate: Date?
    
    var albumables: [Albumable]?
    
    var artistables: [Artistable]?
    
    var duration: TimeInterval?

    var topResultable: (TopResultable)?
    
    func songWithAlbums() async throws -> Songable {
        SongMock.mock
    }
    
    func songWithArtists() async throws -> Songable {
        SongMock.mock
    }
    
    func play() async throws {}
}

extension SongMock {
    static let mock: SongMock = SongMock(
        musicId: "1234",
        primaryColor: Color.primary,
        secondaryColor: Color.secondary,
        backgroundColor: Color.yellow,
        isReleased: true, 
        title: "Whirl Wind Cliffside",
        artistName: "Rick",
        artwork: nil,
        albumTitle: "Tumbler",
        releaseDate: .distantPast,
        albumables: [AlbumMock.mock],
        artistables: [ArtistMock.mock],
        duration: nil,
        topResultable: nil
    )
}
