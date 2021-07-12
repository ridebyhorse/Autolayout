//
//  Post.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

struct Post {
    
    let title: String
}

struct PostExample {
    var author: String
    var description: String
    var image: UIImage
    var likes: Int
    var views: Int
}



let post1 = PostExample(author: "Penny Torrens", description: "There was once a woman who was very, very cheerful, though she had little to make her so; for she was old, and poor, and lonely. She lived in a little bit of a cottage and earned a scant living by running errands for her neighbours, getting a bite here, a sup there, as reward for her services. So she made shift to get on, and always looked as spry and cheery as if she had not a want in the world.", image: UIImage(named: "the-bogey-beast")!, likes: 17, views: 68)

let post2 = PostExample(author: "Peter Kostenko", description: "ere’s what it’s like to bear up under the burden of so much guilt: everywhere you drag yourself you leave a trail. Late at night, you gaze back and view an upsetting record of where you’ve been. At the medical center where they brought my brothers, I stood banging my head against a corner of a crash cart. When one of the nurses saw me, I said, “There; that’s better. That kills the thoughts before they grow.”", image: UIImage(named: "box")!, likes: 112, views: 546)

let post3 = PostExample(author: "Lynn Zhang", description: "You see, our schools directed all their efforts to inculcating industriousness (somewhat successfully), obedience (fairly successfully), and toadyism (very successfully). Each graduation produced a new crop of little yes-people. Our children learned criticism from their families, and from the street.", image: UIImage(named: "hands-child")!, likes: 7, views: 24)

let post4 = PostExample(author: "Gabe Some", description: "What Is Post-COVID Fatigue?", image: UIImage(named: "vaccine")!, likes: 327, views: 1408)

let publications: [PostExample] = [post1, post2, post3, post4]
