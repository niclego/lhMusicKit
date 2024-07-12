//
//  Album+Extensions.swift
//
//
//  Created by Nicolas Le Gorrec on 7/6/24.
//

import MusicKit
import SwiftUI

extension Album: Albumable {
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

    public var songables: [any Songable]? {
        guard let songs = tracks else { return nil }
        return Array(songs)
    }

    public var artistables: [any Artistable]? {
        guard let artists = artists else { return nil }
        return Array(artists)
    }

    public var releaseDateTime: Date? {
        return self.releaseDate
    }

    public func albumWithSongs() async throws -> Albumable {
        return try await self.with([.tracks])
    }

    public func albumWithArtists() async throws -> any Albumable {
        return try await self.with([.artists])
    }

    public func play() async throws {
        SystemMusicPlayer.shared.queue = [self]
        try await SystemMusicPlayer.shared.play()
    }
}
