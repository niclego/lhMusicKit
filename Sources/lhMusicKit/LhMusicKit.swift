//
//  File.swift
//  
//
//  Created by Nicolas Le Gorrec on 2/13/24.
//

import MusicKit

public enum MusicKitError: Error {
    case noSongForMusicItemId
    case noAlbumForMusicItemId
    case noArtistForMusicItemId
}

public enum MusicItemType {
    case artist
    case album
    case song
}

public struct LhMusicKit: MusicKitable {
    private let player = SystemMusicPlayer.shared

    public func catalogTopResultsRequest(for searchTerm: String) async throws -> [MusicCatalogSearchResponse.TopResult] {
        let _ = await MusicAuthorization.request()

        var req = MusicCatalogSearchRequest(
            term: searchTerm,
            types: []
        )
        req.includeTopResults = true
        req.limit = 10

        return try await req.response().topResults.map { $0 }
    }

    public func catalogSongRequest(for musicItemId: String) async throws -> Song {
        let req = MusicCatalogResourceRequest<Song>(matching: \.id, equalTo: MusicItemID(stringLiteral: musicItemId))
        guard let song = try await req.response().items.first else { throw MusicKitError.noSongForMusicItemId }
        return song
    }

    public func catalogAlbumRequest(for musicItemId: String) async throws -> Album {
        let req = MusicCatalogResourceRequest<Album>(matching: \.id, equalTo: MusicItemID(stringLiteral: musicItemId))
        guard let album = try await req.response().items.first else { throw MusicKitError.noAlbumForMusicItemId }
        return album
    }

    public func catalogArtistRequest(for musicItemId: String) async throws -> Artist {
        let req = MusicCatalogResourceRequest<Artist>(matching: \.id, equalTo: MusicItemID(stringLiteral: musicItemId))
        guard let artist = try await req.response().items.first else { throw MusicKitError.noArtistForMusicItemId }
        return artist
    }

    public func playSong(musicItemId: String) async throws {
        let song = try await catalogSongRequest(for: musicItemId)
        player.queue = [song]
        try await player.play()
    }

    public func playAlbum(musicItemId: String) async throws {
        let album = try await catalogAlbumRequest(for: musicItemId)
        player.queue = [album]
        try await player.play()
    }

    public func pause() {
        player.pause()
    }
}
