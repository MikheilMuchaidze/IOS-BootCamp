import Foundation

//bloger creration
let bloger1 = Blog(createdPosts: ["about IosDev", "about androidDev", "about WebDev"], postCategory: [.learning, .computers], postMark: [.point3, .point4, .point2])
let bloger2 = Blog(createdPosts: ["Blues", "Rock", "Metal", "Punl"], postCategory: [.learning, .movies], postMark: [.point3, .point4, .point4, .point5])
let bloger3 = Blog(createdPosts: ["about Rabit", "about Cat", "about Dog", "about Cow"], postCategory: [.learning, .computers], postMark: [.point3, .point0, .point2, .point3])

bloger1.bloggerPosts()
bloger1.avarageMarkForPost()
bloger1.PopularPost()

