//
//  LhMusicKitMock.swift
//
//
//  Created by Nicolas Le Gorrec on 7/4/24.
//

public struct LhMusicKitMock: MusicKitable {
    public init() {}

    public func catalogTopResultsRequest(for searchTerm: String) async throws -> [TopResultable] {
        []
    }
    
    public func catalogSongsRequests(for musicItemIds: [String]) async throws -> [Songable] {
        []
    }
    
    public func catalogSongRequest(for musicItemId: String) async throws -> Songable {
        return SongMock.mock
    }
    
    public func catalogAlbumRequest(for musicItemId: String) async throws -> Albumable {
        return AlbumMock.mock
    }
    
    public func catalogArtistRequest(for musicItemId: String) async throws -> Artistable {
        return ArtistMock.mock
    }
    
    public func play(_ song: Songable) async throws {
        return try await song.play()
    }
    
    public func play(_ album: Albumable) async throws {
        return try await album.play()
    }
    
    public func requestMusicAccess() async {}

    public func pause() {}
}
