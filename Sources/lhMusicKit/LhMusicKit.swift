//
//  File.swift
//  
//
//  Created by Nicolas Le Gorrec on 2/13/24.
//

import MusicKit
import Combine

public enum MusicKitError: Error {
    case noSongForMusicItemId
    case noAlbumForMusicItemId
    case noArtistForMusicItemId
}

public struct LhMusicKit: MusicKitable {
    public init() {}

    public func catalogTopResultsRequest(for searchTerm: String) async throws -> [TopResultable] {
        let _ = await MusicAuthorization.request()

        var req = MusicCatalogSearchRequest(
            term: searchTerm,
            types: []
        )
        req.includeTopResults = true
        req.limit = 10

        return try await req.response().topResults.map { $0 }
    }

    public func catalogSongsRequests(for musicItemIds: [String]) async throws -> [Songable] {
        return try await withThrowingTaskGroup(of: Songable.self, returning: [Songable].self) { taskGroup in
            for musicItemId in musicItemIds {
                taskGroup.addTask { try await catalogSongRequest(for: musicItemId) }
            }

            return try await taskGroup.reduce(into: [Songable]()) { partialResult, name in
                partialResult.append(name)
            }
        }
    }

    public func catalogSongRequest(for musicItemId: String) async throws -> Songable {
        let req = MusicCatalogResourceRequest<Song>(matching: \.id, equalTo: MusicItemID(stringLiteral: musicItemId))
        guard let song = try await req.response().items.first else { throw MusicKitError.noSongForMusicItemId }
        return song
    }

    public func catalogAlbumRequest(for musicItemId: String) async throws -> Albumable {
        let req = MusicCatalogResourceRequest<Album>(matching: \.id, equalTo: MusicItemID(stringLiteral: musicItemId))
        guard let album = try await req.response().items.first else { throw MusicKitError.noAlbumForMusicItemId }
        return album
    }

    public func catalogArtistRequest(for musicItemId: String) async throws -> Artistable {
        let req = MusicCatalogResourceRequest<Artist>(matching: \.id, equalTo: MusicItemID(stringLiteral: musicItemId))
        guard let artist = try await req.response().items.first else { throw MusicKitError.noArtistForMusicItemId }
        return artist
    }

    public func play(_ song: Songable) async throws {
        try await song.play()
    }

    public func play(_ album: Albumable) async throws {
        try await album.play()
    }

    public func pause() {
        SystemMusicPlayer.shared.pause()
    }

    public func requestMusicAccess() async {
        let _ = await MusicAuthorization.request()
    }

    public var isAccessEnabled: Bool {
        MusicAuthorization.currentStatus == .authorized
    }
}

extension LhMusicKit: Sendable {}
