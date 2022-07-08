import Foundation
/*
აღწერეთ ბანკი, რომელსაც ეყოლება კლიენტები, ექნება ბანკომატი და ორი ტიპის ბარათი (სადებეტო, საკრედიტო) რომელსაც თავის მხრივ _ 3 სავალუტე ანგარიში.
უნდა არსებობდეს შესაბამისი ფუნქციონალი:
- კლიენტის რეგისტრაცია (სახელი, გვარი, პირადი ნომერი).
- ბარათის მოთხოვნა,
- ანგარიშიდან თანხის გატანის მოთხოვნა,
- ანგარიშზე ნაშთის შემოწმება,
- ანგარიშზე თანხის შეტანა,
- უფლების მოთხოვნა პირადი ინფორმაციის გადამოწმებაზე.
თქვენი შეხედულებისამებრ განსაზღვრეთ ობიექტებს შორის დამოკიდებულებები და ფუნქციონალი, მათი სტრუქტურა (object type-ები);
*/

enum CardType {
    case debitcard
    case creditcard
}

enum Currency {
    case gel
    case usd
    case euro
}

struct FundsOnAccount {
    var accounBalance: [Currency: Double]
}

class ClientInfo {
    let fullName: String
    let id: Int
    let card: CardType
    let balanceOnAccount: FundsOnAccount
    
    init(fullName: String, id: Int, cardType: CardType, balanceOnAccount: FundsOnAccount) {
        self.fullName = fullName
        self.id = id
        self.card = cardType
        self.balanceOnAccount = balanceOnAccount
    }
    
    func withdrawMoney(forClient: String, currency: Currency, amount: Double) -> Double {
        let filterByClientName = clientsList.filter { elem in
            elem.fullName == forClient
        }
        let widthdrawFunds = filterByClientName[0].balanceOnAccount.accounBalance[currency]! - amount
        return widthdrawFunds
    }
    
    func checkBalance(forClient: String, currency: Currency, amount: Double) -> Double {
        let filterByClientName = clientsList.filter { elem in
            elem.fullName == forClient
        }
        let balance = filterByClientName[0].balanceOnAccount.accounBalance[currency]!
        return balance
    }
    
    func showCurrentBalance() {
        
    }

}

var clientsList: [ClientInfo] = []

class Bank {
    var clients: [ClientInfo] = clientsList
    
    init(clients: [ClientInfo]) {
        self.clients = clients
    }
    
}

func registerNew(customer: ClientInfo) -> [ClientInfo] {
    clientsList.append(customer)
    return clientsList
}

let mikheilMuchaidze = registerNew(customer: .init(fullName: "Mikheil Muchaidze", id: 01027, cardType: .creditcard, balanceOnAccount: .init(accounBalance: [.usd : 1000, .gel : 2000])))
let ninoMsxiladze = registerNew(customer: .init(fullName: "Nino Msxiladze", id: 01004, cardType: .debitcard, balanceOnAccount: .init(accounBalance: [.gel : 5000, .usd : 7000])))

let meMinus500Gel = clientsList.map { elem in
    elem.withdrawMoney(forClient: "Mikheil Muchaidze", currency: .gel, amount: 500)
}

clientsList.forEach { elem in
    print(elem.balanceOnAccount)
}

