//
//  PlaylistController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    func add(playlistWithName name: String) {
        // Creating a new playlist using the name from the parameter, we are initializing it with our CoreDataStack.context, can't see it happening here because we set a default value in our convenience initializer
        _ = Playlist(name: name)
        // Saving changes to persistent store
        saveToPersistentStore()
    }
    
    func delete(playlist: Playlist) {
        CoreDataStack.context.delete(playlist)
        saveToPersistentStore()
    }


    // MARK: - Persistence
    
    func saveToPersistentStore() {
        do {
            // Trying to save what is in our MOC to our persistent store
            try CoreDataStack.context.save()
        } catch {
            print(error, error.localizedDescription)
        }
    }
    
    
    // MARK: - Properties
    
    var playlists: [Playlist] {
        let moc = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        let results = try? moc.fetch(fetchRequest)
        return results ?? []
    }
}
