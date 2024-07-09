//
//  Songable.swift
//
//
//  Created by Nicolas Le Gorrec on 7/4/24.
//

import MusicKit
import SwiftUI

public protocol Songable {
    var musicId: String { get }
    var primaryColor: Color { get }
    var secondaryColor: Color { get }
    var backgroundColor: Color { get }
    var artwork: Artwork? { get }
    var title: String { get }
    var artistName: String { get }
    var albumTitle: String? { get }
    var releaseDate: Date? { get }
    var albumables: [Albumable]? { get }
    var artistables: [Artistable]? { get }
    var duration: TimeInterval? { get }
    var isReleased: Bool { get }

    func songWithAlbums() async throws -> Songable
    func songWithArtists() async throws -> Songable
}
