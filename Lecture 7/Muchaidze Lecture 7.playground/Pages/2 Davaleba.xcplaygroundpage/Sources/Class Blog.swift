import Foundation

/*
დავალება #2

შექმენით ბლოგერის კლასი, რომელსაც აქვს:
 
    მის მიერ შექმნილი პოსტების ჩამონათვალი.
    პოსტები შეიძლება ერთზე მეტ კატეგორიას მოიცავდნენ.
    თითოეულ პოსტს უნდა ჰქონდეს შეფასება 0-დან 5-ის ჩათვლით.
    ბლოგერს უნდა შეეძლოს გვითხრას, თუ რამდენია მისი პოსტების საშუალო შეფასება.
    რომელია მისი ყველაზე პოპულარული პოსტი.
 
თქვენი ამოცანაა შექმნათ კლასი ბლოგერი და სტრუქტურა პოსტი. მინიმუმ ეს ორი, მაგრამ შეიგიძლიათ გამოიყენოთ სხვადასხვა ტიპი, რომლებიც უკეთესი მოდელის შექმნაში დაგეხმარებათ. ვისაც მონაცემთა ბაზებთან ჰქონია შეხება, საუბარია გამართულ რელაციურ მოდელზე. შეგიძლიათ თქვენი ფანტაზიის მიხედვით დაუმატოთ სხვადასხვა ფუნქციები ამა თუ იმ კლასს ან სტუქტურას (ან ენამს).

შექმენით კლასი, რომელიც “მოემსახურება” ბლოგერების კლასს, უნდა შეეძლოს შემდეგ კითხვებზე პასუხი:
 
    რამდენი ბლოგერია ბლოგზე
    რომელია ყველაზე პოპულარული ბლოგერი
    რომელია ყველაზე პოპულარული პოსტი ბლოგზე
    რამდენია ბლოგზე არსებული პოსტების საშუალო შეფასება
    რომელია ყველაზე ხშირად გამოყენებული პოსტის კატეგორია
 */
public class Blog {
    let createdPosts: [String]
    let postCategory: [CategoryforPosts]
    let postMark: [postMarks]
    
    public init (createdPosts: [String], postCategory: [CategoryforPosts], postMark: [postMarks]) {
        self.createdPosts = createdPosts
        self.postCategory = postCategory
        self.postMark = postMark
    }
    
    public func bloggerPosts() {
        var posts = [String]()
        createdPosts.map { elem in
            posts.append(elem)
        }
        print("posts of this blogger -  \(posts)")
    }
    
    public func avarageMarkForPost() {
        let marks = postMark.map { elem in
            elem.rawValue
        }
        let sumOfMarks = marks.reduce(0) { currentSum, elem in
            currentSum + elem
        }
        let avarage = sumOfMarks / Double(marks.count)
        print("avarage mark of this blogger -  \(avarage)")
    }
    
    public func PopularPost() {
        var postMarkDic = [String: Double]()
                
        for i in 0...createdPosts.count-1 {
            postMarkDic[createdPosts[i]] = postMark[i].rawValue
        }
        print("ratings for posts are: \(postMarkDic)")
        print("most popular post of this blogger -  \(postMarkDic.keys.max()!)")
    }
}

public enum CategoryforPosts {
    case computers
    case entertainment
    case learning
    case movies
}

public enum postMarks: Int {
    case point0 = 0
    case point1
    case point2
    case point3
    case point4
    case point5
}
