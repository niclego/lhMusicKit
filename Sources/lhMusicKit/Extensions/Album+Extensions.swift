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
        if let songs = tracks {
            return Array(songs)
        }
        return nil
    }

    public func albumWithSongs() async throws -> Albumable {
        return try await self.with([.tracks])
    }
}
