//
//  Mock.swift
//  Clonegram
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import NetworkManager

class Mock {
    
    public static var users: [UserProfile] = []
    public static var posts: [Post] = []
    public static var texts: [String] = []
    
    static func generateUsers(completion: @escaping () -> Void) {
        Mock.users = []
        UserService.shared.getUsers(page: 0, completion: { (users: [User], nextPage: Int?) in
            Mock.users = users.asUserProfiles
            print("Request next page with index: \(nextPage ?? 0)")
            completion()
        }, error: { (error) in
            print(error)
            completion()
        })
    }
    
    static func generatePosts() {
        Mock.posts = []
        print("Generating \(Mock.users.count) posts")
        for user in Mock.users {
            
            let post = Post(author: user,
                            location: Location(name: "Random Location"),
                            media: generateRandomMedia(),
                            likesCount: Int(arc4random_uniform(UInt32(9999))),
                            postCaption: Mock.texts.random,
                            comments: Mock.getRandomComments(),
                            creationDate: Date())
            Mock.posts.append(post)
        }
    }
    
    static func generateRandomMedia() -> [MediaURL] {
        
        var shouldBeVideo: Bool {
            // videos don't work yet
//            let chanches = Int(arc4random_uniform(UInt32(3)))
//            return chanches == 0
            return false
        }
        
        let moreThanOne = Bool.random()
        if moreThanOne {
            let count = Int(arc4random_uniform(UInt32(5))) + 3
            let array = Array<MediaURL>.init(repeating: MediaURL(URL(string: ""), .image), count: count + 1)
            return array.map { _ in return shouldBeVideo ? generateRandomVideo() : generateRandomImage() }
        } else {
            return [shouldBeVideo ? generateRandomVideo() : generateRandomImage() ]
        }
        
    }
    
    static func generateRandomImage() -> MediaURL {
        let imageID = Int(arc4random_uniform(UInt32(600)))
        let url = URL(string: "https://picsum.photos/id/\(imageID)/600/600") ?? generateRandomImage().url
        return MediaURL(url, .image)
    }
    
    static func generateRandomVideo() -> MediaURL {
        let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
        return MediaURL(url, .video)
    }
    
    static func getRandomComments() -> [Comment] {
        let commentCount = Int(arc4random_uniform(UInt32(19)))
        var comments: [Comment] = []
        for _ in 0...commentCount {
            comments.append(Comment(author: Mock.users.random, text: Mock.texts.random))
        }
        
        return comments
    }
    
    static func generateText() {
        Mock.texts.append("Quisque @quis #pretium ipsum, nec efficitur turpis. \nMauris #eget tellus lacinia, sagittis ligula vitae, imperdiet tellus. \nMorbi ultricies mollis orci sed molestie. In hac habitasse platea dictumst.")
        Mock.texts.append("Integer @rutrum #dignissim elementum. Donec eu commodo #lorem. \nDonec scelerisque suscipit dui finibus faucibus.")
        Mock.texts.append("Vivamus @odio mi, #consequat vitae risus eget, feugiat elementum ipsum. Maecenas porttitor, ex tincidunt hendrerit mattis, turpis tellus #sollicitudin dui, \nquis lacinia ex nunc in urna. Nunc eu aliquam ante. Sed vehicula hendrerit auctor. Curabitur commodo laoreet ipsum aliquet dictum.")
        Mock.texts.append("Suspendisse @vitae #sem quam.")
        Mock.texts.append("Nunc semper mi in fermentum tristique.")
        Mock.texts.append("Maecenas interdum libero eget orci semper, \neu dapibus nibh lacinia. \nNam sed accumsan nisl. Proin vel metus quam.")
        Mock.texts.append("Mauris @vel massa #id urna scelerisque accumsan.")
        Mock.texts.append("😂")
        Mock.texts.append("Pellentesque @tempus #get dolor quis ornare.")
        Mock.texts.append("Aliquam @ullamcorper #nunc diam, \na blandit metus fringilla ac.")
        Mock.texts.append("Morbi ultricies @mollis orci #sed molestie.")
        Mock.texts.append("Quisque @auctor #laoreet ligula, ac faucibus massa ornare ut. In velit nunc, tincidunt sed aliquet a, rutrum ac urna.")
        Mock.texts.append("Praesent @vel #vestibulum nisl. \nMauris eu imperdiet purus.")
        Mock.texts.append("Ut tempus sem @non quam #faucibus cursus.")
        Mock.texts.append("Aliquam @ullamcorper #nunc diam, a blandit metus fringilla ac.")
        Mock.texts.append("Suspendisse @ac tellus #interdum, gravida lorem sed, laoreet orci.")
        Mock.texts.append("Suspendisse \n@ac \ntellus \n#interdum, \ngravida \nlorem \nsed, \nlaoreet \norci.")
    }
    
}
