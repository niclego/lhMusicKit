//
//  File.swift
//
//
//  Created by Nicolas Le Gorrec on 2/4/24.
//

import MusicKit

public protocol MusicKitable: Sendable {
    func catalogTopResultsRequest(for searchTerm: String) async throws -> [MusicCatalogSearchResponse.TopResult]
    func catalogSongsRequests(for musicItemIds: [String]) async throws -> [Songable]
    func catalogSongRequest(for musicItemId: String) async throws -> Songable
    func catalogAlbumRequest(for musicItemId: String) async throws -> Albumable
    func catalogArtistRequest(for musicItemId: String) async throws -> Artistable
//    func play(_ song: Song) async throws
//    func play(_ album: Album) async throws
    func requestMusicAccess() async
    func pause()
}
