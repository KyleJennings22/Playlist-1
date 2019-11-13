//
//  Song+Convenience.swift
//  PlaylistCodable
//
//  Created by Kyle Jennings on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    convenience init(artist: String, name: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.artist = artist
        self.name = name
        // Where we are connecting the relationship when we pass in a playlist
        self.playlist = playlist
    }
}
