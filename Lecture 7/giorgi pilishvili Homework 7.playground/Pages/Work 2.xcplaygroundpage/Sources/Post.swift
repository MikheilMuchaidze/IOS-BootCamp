import Foundation

public struct Post {
    public var rate: Rate
    public var category: PostCategory
    var type: PostType
    public var fullDescription: String {
        "Post(rate: \(rate), category: \(category), type: \(type)"
    }
    
    public init(rate: Rate, category: PostCategory, type: PostType) {
        self.rate = rate
        self.category = category
        self.type = type
    }
}

// თითოეულ პოსტს უნდა ჰქონდეს შეფასება 0-დან 5-ის ჩათვლით.

public enum Rate: Int {
    case veryGood = 5
    case good = 4
    case average = 3
    case belowAverage = 2
    case bad = 1
    case poor = 0
}

public enum PostType {
    case text(content: String)
    case image(content: String, imageUrl: String)
    case poll(content: String, options: [String])
}

// პოსტები შეიძლება ერთზე მეტ კატეგორიას მოიცავდნენ.

public enum PostCategory {
    case trevel
    case lifestyle
    case healthAndFitness
    case photography
}
