//
//  File.swift
//  
//
//  Created by Nicolas Le Gorrec on 7/18/24.
//

import SwiftUI

struct TopResultMock: TopResultable {
    var musicId: String

    var type: String

    var primaryColor: Color

    var secondaryColor: Color

    var backgroundColor: Color

    var songable: (Songable)?

    var albumable: (Albumable)?

    var artistable: (Artistable)?
}

extension TopResultMock {
    static let mock = TopResultMock(
        musicId: "1234",
        type: "song",
        primaryColor: Color.primary,
        secondaryColor: Color.secondary,
        backgroundColor: Color.yellow
    )
}
