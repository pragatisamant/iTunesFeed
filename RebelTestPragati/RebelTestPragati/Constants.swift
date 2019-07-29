//
//  Constants.swift
//  RebelTestPragati
//
//  Created by Pragati Samant on 20/07/19.
//  Copyright © 2019 Pragati. All rights reserved.
//

import Foundation
class Constants
{
 static let MUSIC =
 "https://rss.itunes.apple.com/api/v1/in/apple-music/hot-tracks/all/10/explicit.json"
 static let MOVIES =
 "https://rss.itunes.apple.com/api/v1/in/movies/top-movies/all/10/explicit.json"
 static let TV_SHOWS =
 "https://rss.itunes.apple.com/api/v1/us/tv-shows/top-tv-episodes/all/10/explicit.json"
 static let BOOKS =
 "https://rss.itunes.apple.com/api/v1/in/books/top-free/all/10/explicit.json"
}

let categories = [Category("MUSIC",Constants.MUSIC),
                  Category("MOVIES",Constants.MOVIES),
                  Category("TV_SHOWS",Constants.TV_SHOWS),
                  Category("BOOKS",Constants.BOOKS)]
class Category {
    var name:String!
    var url:String!
    init(_ name:String,_ url:String) {
        self.name = name
        self.url = url
    }
}
