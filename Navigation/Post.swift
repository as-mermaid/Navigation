//
//  Post.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 15.01.2023.
//

import Foundation

struct Post {
    
//     var title: String 
    
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
}

extension Post {
    
    static func makeFeed() -> [Post] {
        [
            Post(author: "Shark", description: "Underwater landscape", image: "post1", likes: 287, views: 786),
            Post(author: "Turtle", description: "Drown", image: "post2", likes: 452, views: 987),
            Post(author: "Cthulhu", description: "Cthulhu", image: "post3", likes: 213, views: 543),
            Post(author: "Swordfish", description: "The reef", image: "post4", likes: 454, views: 864),
        ]
    }
}
