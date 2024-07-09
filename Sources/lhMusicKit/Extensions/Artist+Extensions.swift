//
//  Artist+Extensions.swift
//
//
//  Created by Nicolas Le Gorrec on 7/6/24.
//

import MusicKit
import SwiftUI

extension Artist: Artistable {
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

    public var albumables: [Albumable]? {
        if let albums = fullAlbums {
            return Array(albums)
        }
        return nil
    }

    public var topSongables: [Songable]? {
        if let songs = topSongs {
            return Array(songs)
        }
        return nil
    }

    public func artistWithAlbums() async throws -> Artistable {
        return try await self.with([.fullAlbums])
    }

    public func artistWithTopSongs() async throws -> Artistable {
        return try await self.with([.topSongs])
    }
}
