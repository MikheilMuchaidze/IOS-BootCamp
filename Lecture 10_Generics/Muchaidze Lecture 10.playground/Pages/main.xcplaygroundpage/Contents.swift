//: [Previous](@previous)

import Foundation

//დაწერეთ პროტოკოლი DataFetcher რომელსაც ექნება associatedtype APIData და ფუნქცია getData() -> [APIData] გააკეთეთ კლასები CarFetcher, VideoGameFetcher და BookFetcher რომელიც დაეთანხმება პროტოკოლს და დააბრუნებს შესაბამის მონაცემებს(dummy data).

protocol DataFetcher {
    associatedtype APIData
    func getData() -> [APIData]
}

class BookFetcher: DataFetcher {
    func getData() -> [Book] {
        [
            Book(title: "Harry Potter", id: 86857, rating: "Medium", price: 39.99),
            Book(title: "Dune", id: 66437, rating: "Very high", price: 54.99)
        ]
    }
}

class CarFetcher: DataFetcher {
    func getData() -> [Car] {
        [
            Car(mark: "BMW", id: 00203, rating: "High", price: 50_000.0),
            Car(mark: "Toyota", id: 34445, rating: "Very high", price: 35_000.0),
        ]
    }
}

class VideoGameFetcher: DataFetcher {
    func getData() -> [VideoGame] {
        [
            VideoGame(name: "Dark Souls", id: 22334, rating: "Very High", price: 35.99),
            VideoGame(name: "Elden Ring", id: 54454, rating: "Very High", price: 44.99)
        ]
    }
}

//მონაცემები უნდა ეთანხმებოდნენ პროტოკოლს Model რომელსაც თავის მხრივ ეჭირება პარამეტრები id, rating, price (მონაცემებს უნდა ჰქოდეთ განსხავებული ტიპის პარამეტრები Book - title, Car - mark, VideoGame - name).
protocol Model {
    var id: Int { get set }
    var rating: String { get set }
    var price: Double  { get set }
}

class Book: Model {
    var title: String
    
    var id: Int
    var rating: String
    var price: Double
    
    init(title: String, id: Int, rating: String, price: Double) {
        self.title = title
        self.id = id
        self.rating = rating
        self.price = price
    }
}

class Car: Model {
    let mark: String
    
    var id: Int
    var rating: String
    var price: Double
    
    init(mark: String, id: Int, rating: String, price: Double) {
        self.mark = mark
        self.id = id
        self.rating = rating
        self.price = price
    }
}

class VideoGame: Model {
    let name: String
    
    var id: Int
    var rating: String
    var price: Double
    
    init(name: String, id: Int, rating: String, price: Double) {
        self.name = name
        self.id = id
        self.rating = rating
        self.price = price
    }
}

let test = VideoGameFetcher()
test.getData().forEach { elem in
    print(elem.name)
}

//შექმენით და გამოიძახეთ ქლოჟერიანი ფუნქცია რომელიც დააბრუნებს მანქანის სატესტო მასივს



//დაწერეთ კლასი DataProcessor რომელსაც ეჭირება generic პარამეტრი data და ექნება მეთოდები calculateTotalPriceOfAllElements(), calculateAveragePrice(), getItemById(), highestRating(), lowestRating().
class DataProcessor<T: Model> {
    var data: [T]
    
    init(data: [T]) {
        self.data = data
    }
    
    func calculateTotalPriceOfAllElements() -> Double {
        data.reduce(0.0) { $0 + $1.price }
    }
    
    func calculateAveragePrice() -> Double {
        calculateTotalPriceOfAllElements() / Double(data.count)
    }
    
    func getItemBy(id: Int) -> T? {
        data.first{ $0.id == id }
    }
    
    func highestRating() -> [T] {
        let sortedHigh = data.sorted { first, second in
            first.rating > second.rating
        }
        return sortedHigh
    }
    
    func lowestRating() -> [T] {
        let sortedLow = data.sorted { first, second in
            first.rating < second.rating
        }
        return sortedLow
    }
}

//დაწერეთ კლასები CarProccessor, BookProccessor და VideoGameProccessor რომელიც იქნებიან DataProcessor() კლასის შვილობილი კლასები ეჭირებათ შესაბამისი fetcher(car - carFetcher და ა.შ.) და დაუსეტავენ მშობელ კლასებს დატას.

class BookProccessor: DataProcessor<Book> {
    let bookFetcher: BookFetcher
    
    init(bookFetcher: BookFetcher) {
        self.bookFetcher = bookFetcher
        super.init(data: bookFetcher.getData())
    }
}

class CarProccessor: DataProcessor<Car> {
    let carFetcher: CarFetcher
    
    init(carFetcher: CarFetcher) {
        self.carFetcher = carFetcher
        super.init(data: carFetcher.getData())
    }
}

class VideoGameProccessor: DataProcessor<VideoGame> {
    let videoGameFetcher: VideoGameFetcher
    
    init(videoGameFetcher: VideoGameFetcher) {
        self.videoGameFetcher = videoGameFetcher
        super.init(data: videoGameFetcher.getData())
    }
}

//დაწერეთ generic კლასი Controller რომელას ეჭირება T ტიპის DataProcessor და ფუნქცია printInfo() რომლის მოვალეობა იქნება დაბეჭდოს შესაბამისი მოდელის პარამეტრები (Book - title, Car - mark, VideoGame - name).
class Controller<T: Model> {
    let dataProcess: DataProcessor<T>
    
    init(dataProcess: DataProcessor<T>){
        self.dataProcess = dataProcess
    }
    
    func printInfo() {
        dataProcess.data.forEach { elem in
            if let bookTitle = elem as? Book {
                print(bookTitle.title)
            }
            if let carMark = elem as? Car {
                print(carMark.mark)
            }
            if let videGameName = elem as? VideoGame {
                print(videGameName.name)
            }
        }
    }

}
