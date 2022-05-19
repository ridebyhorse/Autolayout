//
//  Post.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import iOSIntPackage

public struct Post {
    
    public let title: String
}

public struct PostExample {
    public var author: String
    public var description: String
    public var image: UIImage
    public var likes: Int
    public var views: Int
}

public let postFeedVC: Post = Post(title: "Пост")
  

public var post1 = PostExample(author: "Penny Torrens", description: "There was once a woman who was very, very cheerful, though she had little to make her so; for she was old, and poor, and lonely. She lived in a little bit of a cottage and earned a scant living by running errands for her neighbours, getting a bite here, a sup there, as reward for her services. So she made shift to get on, and always looked as spry and cheery as if she had not a want in the world.", image: UIImage(named: "the-bogey-beast")!, likes: 17, views: 68)

public var post2 = PostExample(author: "Peter Kostenko", description: "ere’s what it’s like to bear up under the burden of so much guilt: everywhere you drag yourself you leave a trail. Late at night, you gaze back and view an upsetting record of where you’ve been. At the medical center where they brought my brothers, I stood banging my head against a corner of a crash cart. When one of the nurses saw me, I said, “There; that’s better. That kills the thoughts before they grow.”", image: UIImage(named: "box")!, likes: 112, views: 546)

public var post3 = PostExample(author: "Lynn Zhang", description: "You see, our schools directed all their efforts to inculcating industriousness (somewhat successfully), obedience (fairly successfully), and toadyism (very successfully). Each graduation produced a new crop of little yes-people. Our children learned criticism from their families, and from the street.", image: UIImage(named: "hands-child")!, likes: 7, views: 24)

public var post4 = PostExample(author: "Gabe Some", description: "What Is Post-COVID Fatigue?", image: UIImage(named: "vaccine")!, likes: 327, views: 1408)

//public func applyFilters() {
//    
//    let filter = ImageProcessor()
//    
//    filter.processImage(sourceImage: post1.image, filter: .bloom(intensity: 0.4)) { image in
//        post1.image = image!
//    }
//    
//    filter.processImage(sourceImage: post2.image, filter: .monochrome(color: .green, intensity: 0.3)) { image in
//        post2.image = image!
//    }
//    
//    filter.processImage(sourceImage: post3.image, filter: .sepia(intensity: 0.6)) { image in
//        post3.image = image!
//    }
//    
//    filter.processImage(sourceImage: post4.image, filter: .posterize) { image in
//        post4.image = image!
//    }
//}

public let publications: [PostExample] = [post1, post2, post3, post4]
