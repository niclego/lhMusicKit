//
//  File.swift
//
//
//  Created by Nicolas Le Gorrec on 2/4/24.
//

import Foundation
import MusicKit

public protocol MusicKitable {
    func catalogTopResultsRequest(for searchTerm: String) async throws -> [MusicCatalogSearchResponse.TopResult]
    func catalogSongRequest(for musicItemId: String) async throws -> Song
    func catalogAlbumRequest(for musicItemId: String) async throws -> Album
    func catalogArtistRequest(for musicItemId: String) async throws -> Artist
    func play(_ song: Song) async throws
    func play(_ album: Album) async throws
    func pause()
}
