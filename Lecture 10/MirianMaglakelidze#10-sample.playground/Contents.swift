import UIKit

//დაწერეთ პროტოკოლი DataFetcher რომელსაც ექნება associatedtype APIData და ფუნქცია getData() -> [APIData] გააკეთეთ კლასები CarFetcher, VideoGameFetcher და BookFetcher რომელიც დაეთანხმება პროტოკოლს და დააბრუნებს შესაბამის მონაცემებს(dummy data).

protocol DataFetcher {
    associatedtype APIData
    func getData() -> [APIData]
}

class CarFetcher: DataFetcher {
    public func getData() -> [Car] {
        [
            Car(rating: 3, price: 32000, model: "BMW_M3"),
            Car(rating: 5, price: 43222, model: "AUDI_Q7")
        ]
    }
}

class VideoGameFetcher: DataFetcher {
    public func getData() -> [VideoGame] {
        [
            VideoGame(rating: 5, price: 30, name: "Mario"),
            VideoGame(rating: 2, price: 32, name: "PubGe")
        ]
    }
}

class BookFetcher: DataFetcher {
    public func getData() -> [Book] {
        [
            Book(rating: 6, price: 30, title: "Sherlock Holmes"),
            Book(rating: 6, price: 20, title: "Three Musketeers")
        ]
    }
}

//მონაცემები უნდა ეთანხმებოდნენ პროტოკოლს Model რომელსაც თავის მხრივ ეჭირება პარამეტრები id, rating, price (მონაცემებს უნდა ჰქოდეთ განსხავებული ტიპის პარამეტრები Book - title, Car - mark, VideoGame - name).

protocol Model {
    var id: String { get }
    var rating: Int { get set }
    var price: Double { get set }
}

struct Car: Model {
    var id: String
    var rating: Int
    var price: Double
    let model: String
    
    init(rating: Int, price: Double, model: String) {
        self.id = UUID().uuidString
        self.rating = rating
        self.price = price
        self.model = model
    }
}

struct Book: Model {
    var id: String
    var rating: Int
    var price: Double
    let title: String
    
    init(rating: Int, price: Double, title: String) {
        self.id = UUID().uuidString
        self.rating = rating
        self.price = price
        self.title = title
    }
}

struct VideoGame: Model {
    var id: String
    var rating: Int
    var price: Double
    let name: String
    
    init(rating: Int, price: Double, name: String) {
        self.id = UUID().uuidString
        self.rating = rating
        self.price = price
        self.name = name
    }
}

//დაწერეთ კლასი DataProcessor რომელსაც ეჭირება generic პარამეტრი data და ექნება მეთოდები calculateTotalPriceOfAllElements(), calculateAveragePrice(), getItemById(), highestRating(), lowestRating().

class DataProcessor<T: Model> {
    var data: [T]
    
    init(data: [T]) {
        self.data = data
    }
    
    func calculateTotalPriceOfAllElements() -> Double { data.reduce(0.0) { $0 + $1.price } }
    
    func calculateAveragePrice() -> Double { self.calculateTotalPriceOfAllElements() / Double(data.count) }

    func getItemById(id: String) -> T? { data.first { $0.id == id } }

    func highestRating() -> T { data.max { $0.rating < $1.rating }! }

    func lowestRating() -> T { data.min { $0.rating < $1.rating }! }
}

//დაწერეთ კლასები CarProccessor, BookProccessor და VideoGameProccessor რომელიც იქნებიან DataProcessor() კლასის შვილობილი კლასები ეჭირებათ შესაბამისი fetcher(car - carFetcher და ა.შ.) და დაუსეტავენ მშობელ კლასებს დატას.


class CarProccessor: DataProcessor<Car> {
    private let carFetcher: CarFetcher
    
    init(carFetcher: CarFetcher) {
        self.carFetcher = carFetcher
        super.init(data: carFetcher.getData())
    }
}

class BookProccessor: DataProcessor<Book> {
    private let bookFetcher: BookFetcher
    
    init(bookFetcher: BookFetcher) {
        self.bookFetcher = bookFetcher
        super.init(data: bookFetcher.getData())
    }
}

class VideoGameProccessor: DataProcessor<VideoGame> {
    private let videoGameFetcher: VideoGameFetcher
    
    init(videoGameFetcher: VideoGameFetcher) {
        self.videoGameFetcher = videoGameFetcher
        super.init(data: videoGameFetcher.getData())
    }
}

//დაწერეთ generic კლასი Controller რომელას ეჭირება T ტიპის DataProcessor და ფუნქცია printInfo() რომლის მოვალეობა იქნება დაბეჭდოს შესაბამისი მოდელის პარამეტრები (Book - title, Car - mark, VideoGame - name).

class Controller<T: Model> {
    private let dataProcessor: DataProcessor<T>
    
    init(dataProcessor: DataProcessor<T>) {
        self.dataProcessor = dataProcessor
    }
    
    func printInfo() {
        dataProcessor.data.forEach {
            if let carModel = $0 as? Car {
                print(carModel.model)
            }
            
            if let bookModel = $0 as? Book {
                print(bookModel.title)
            }
            
            if let videoGameModel = $0 as? VideoGame {
                print(videoGameModel.name)
            }
        }
    }
}
