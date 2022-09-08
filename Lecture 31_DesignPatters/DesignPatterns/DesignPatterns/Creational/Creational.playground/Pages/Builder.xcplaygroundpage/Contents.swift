import Foundation

//MARK: - Product

enum DishCategory: Int {
    case apetizer, mainDish, dessert, drink
}

struct Dish {
    var name: String
    var price: Float
}

struct OrderItem {
    var dish: Dish
    var count: Int = 1
}

struct Order {
    var apetizers: [OrderItem] = []
    var mainDishes: [OrderItem] = []
    var desserts: [OrderItem] = []
    var drinks: [OrderItem] = []
    
    var totalPrice: Float {
        let items = apetizers + mainDishes + desserts + drinks
        return items.reduce(Float(0), { $0 + $1.dish.price * Float($1.count) })
    }
}

//MARK: - Builder
class OrderBuilder {
    var order = Order()
    
    func addApetizer(dish: Dish) {
        addNew(dish: dish, in: order.apetizers, category: .apetizer)
    }
    
    func addMainDish(dish: Dish) {
        addNew(dish: dish, in: order.mainDishes, category: .mainDish)
    }
    
    func addDessert(dish: Dish) {
        addNew(dish: dish, in: order.desserts, category: .dessert)
    }
    
    func addDrink(dish: Dish) {
        addNew(dish: dish, in: order.drinks, category: .drink)
    }

    private func addNew(dish: Dish, in list: [OrderItem], category: DishCategory) {
        
        var item: OrderItem! = list.filter({ $0.dish.name == dish.name } ).first
        
        guard item == nil else {
            item.count += 1
            return
        }
        
        item = OrderItem(dish: dish)
        
        switch category {
        case .apetizer:
            order.apetizers.append(item)
        case .mainDish:
            order.mainDishes.append(item)
        case .dessert:
            order.desserts.append(item)
        case .drink:
            order.drinks.append(item)
        }
    }
}

let builder = OrderBuilder()

let apetizer = Dish(name: "apetizer 1", price: 7.00)
let main = Dish(name: "main 1", price: 11.40)
let drink = Dish(name: "drink 1", price: 2.70)
let dessert = Dish(name: "dessert 1", price: 12.70)


builder.addDrink(dish: drink)
builder.addDessert(dish: dessert)
builder.addMainDish(dish: main)
builder.addApetizer(dish: apetizer)

builder.order.totalPrice


