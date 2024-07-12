//
//  File.swift
//  
//
//  Created by Nicolas Le Gorrec on 7/9/24.
//

import MusicKit
import SwiftUI

extension MusicCatalogSearchResponse.TopResult: TopResultable {
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
    
    public var type: String {
        if case .album = self {
            return "album"
        }
        else if case .artist = self {
            return "artist"
        }
        else if case .song = self {
            return "song"
        }

        return "none"
    }
    
    public var musicId: String {
        return self.id.description
    }

    public var songable: Songable? {
        guard case .song(let song) = self else {
            return nil
        }

        return song
    }

    public var albumable: Albumable? {
        guard case .album(let album) = self else {
            return nil
        }

        return album
    }

    public var artistable: Artistable? {
        guard case .artist(let artist) = self else {
            return nil
        }

        return artist
    }
}
