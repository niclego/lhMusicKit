//
//  Track+Extensions.swift
//
//
//  Created by Nicolas Le Gorrec on 7/4/24.
//

import MusicKit
import SwiftUI

extension Track: Songable {
    public var isReleased: Bool {
        guard let data = releaseDate else { return false }
        return data < Date.now
    }

    public var artistables: [any Artistable]? {
        if let artists = artists {
            return Array(artists)
        }
        return nil
    }

    public var albumables: [Albumable]? {
        if let albums = albums {
            return Array(albums)
        }
        return nil
    }

    public var musicId: String { self.id.description }

    public var primaryColor: Color {
        if let color = artwork?.primaryTextColor {
            return Color(cgColor: color)
        }
        else {
            return .primary
        }
    }

    public var secondaryColor: Color {
        if let color = artwork?.secondaryTextColor {
            return Color(cgColor: color)
        }
        else {
            return .secondary
        }
    }

    public var backgroundColor: Color {
        if let color = artwork?.backgroundColor {
            return Color(cgColor: color)
        }
        else {
            return .secondary
        }
    }

    public func songWithAlbums() async throws -> Songable {
        return self
    }

    public func songWithArtists() async throws -> Songable {
        return self
    }

    public func play() async throws {
        SystemMusicPlayer.shared.queue = [self]
        try await SystemMusicPlayer.shared.play()
    }
}

