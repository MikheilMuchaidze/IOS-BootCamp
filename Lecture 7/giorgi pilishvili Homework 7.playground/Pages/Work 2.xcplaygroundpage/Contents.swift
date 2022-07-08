import UIKit

class Blogger {
    var name: String
    
    // მის მიერ შექმნილი პოსტების ჩამონათვალი.
    
    var posts = [Post]()
        
    init(name: String, posts: [Post]) {
        self.name = name
        self.posts = posts
    }
    
    // ბლოგერს უნდა შეეძლოს გვითხრას, თუ რამდენია მისი პოსტების საშუალო შეფასება.
    
    func getAvarageOfRates() -> Int {
        posts.reduce(0) { partialResult, post in
            partialResult + post.rate.rawValue
        } / posts.count
    }
    
    // რომელია მისი ყველაზე პოპულარული პოსტი.
    
    var popularPost: Post? {
        posts.max { $0.rate.rawValue < $1.rate.rawValue }
    }
    
}

// შექმენით კლასი, რომელიც “მოემსახურება” ბლოგერების კლასს, უნდა შეეძლოს შემდეგ კითხვებზე პასუხი:

class Blog {
    
    var bloggers: [Blogger]
    
    var posts: [Post] {
        bloggers.flatMap { $0.posts }
    }
    
    init(bloggers: [Blogger]) {
        self.bloggers = bloggers
    }
    
    // რამდენი ბლოგერია ბლოგზე
    
    func numberOfBloggers() -> Int {
        bloggers.count
    }
    
    // რომელია ყველაზე პოპულარული ბლოგერი
    
    func mostPopularBlogger() -> Blogger? {
        bloggers.max { $0.getAvarageOfRates() < $1.getAvarageOfRates() }
    }
    
    // რომელია ყველაზე პოპულარული პოსტი ბლოგზე
    
    func mostPopularPost() -> Post? {
        posts.max { $0.rate.rawValue < $1.rate.rawValue }
    }
    
    // რამდენია ბლოგზე არსებული პოსტების საშუალო შეფასება
    
    func postsAverageRate() -> Int  {
        posts.reduce(0) { partialResult, post in
            partialResult + post.rate.rawValue
        } / posts.count
    }
    
    // რომელია ყველაზე ხშირად გამოყენებული პოსტის კატეგორია
    
    func frequentlyUsedPostCategory() -> PostCategory? {
        var countOfCategories = [PostCategory:Int]()
        
        posts.forEach { post in
            countOfCategories[post.category] = (countOfCategories[post.category] ?? 0) + 1
        }
        
        return countOfCategories.max { $0.1 < $1.1 }!.key
    }
    
}


// Test

var poll = PostType.poll(content: "question?", options: ["option1", "option2", "option3"])

var posts = [
    Post(rate: Rate.average, category: PostCategory.lifestyle, type: poll),
    Post(rate: Rate.good, category: PostCategory.trevel, type: PostType.text(content: "aranairi araferi")),
    Post(rate: Rate.veryGood, category: PostCategory.photography, type: PostType.text(content: "rame")),
    Post(rate: Rate.poor, category: PostCategory.healthAndFitness, type: PostType.text(content: "albat"))
]

var posts1 = [
    Post(rate: Rate.bad, category: PostCategory.lifestyle, type: poll),
    Post(rate: Rate.good, category: PostCategory.lifestyle, type: PostType.text(content: "aranairi araferi")),
    Post(rate: Rate.average, category: PostCategory.photography, type: PostType.text(content: "rame")),
    Post(rate: Rate.poor, category: PostCategory.trevel, type: PostType.text(content: "albat"))
]

let blogger1 = Blogger(name: "b1", posts: posts)

for post in blogger1.posts {
    print(post.fullDescription)
}

print("პოსტების საშუალო შეფასება: \(blogger1.getAvarageOfRates())")
print("ყველაზე პოპულარული პოსტი: \(blogger1.popularPost!.fullDescription)")


var bloggers = [
    Blogger(name: "b2", posts: posts),
    Blogger(name: "b2", posts: posts1),
    Blogger(name: "b2", posts: posts)
]

let blog = Blog(bloggers: bloggers)

print("ბლოგერების რაოდენობა: \(blog.numberOfBloggers())")
print("ყველაზე პოპულარული ბლოგერი: \(blog.mostPopularBlogger()!)")
print("ყველაზე პოპულარული პოსტი ბლოგზე: \(blog.mostPopularPost()!)")
print("ბლოგზე არსებული პოსტების საშუალო შეფასება: \(blog.postsAverageRate())")
print("ყველაზე ხშირად გამოყენებული პოსტის კატეგორია \(blog.frequentlyUsedPostCategory()!)")
