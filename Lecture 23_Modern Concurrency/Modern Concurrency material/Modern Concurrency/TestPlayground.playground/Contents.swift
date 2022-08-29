import UIKit

var greeting = "Hello, playground"

//MARK: - using nested completion handlers
//func getUserId(completion: @escaping (Int) -> Void) {
//    print("getting id...")
//    DispatchQueue.global().async {
//        sleep(2)
//        let id = 8
//        print("id is \(id)")
//        completion(id)
//    }
//}
//
//func getUserData(by id: Int, completion: @escaping (String, Int) -> Void) {
//    print("getting user data...")
//    DispatchQueue.global().async {
//        sleep(2)
//        let data = ("Giorgi",20)
//        print("data is \(data)")
//        completion(data.0,data.1)
//    }
//}
//
//func getInfoFor(age: Int, completion: @escaping (String) -> Void) {
//    print("getting user Info...")
//    DispatchQueue.global().async {
//        sleep(2)
//        let info = age > 18 ? "🍺" : "🔞"
//        completion(info)
//    }
//}
//
//getUserId { id in
//    getUserData(by: id) { name, age in
//        getInfoFor(age: age) { info in
//            print("info is \(info)")
//        }
//    }
//}


//MARK: - using async await
func getUserIdUsingAsync() async -> Int {
    sleep(2)
    let id = 8
    print("id is \(id)")
    return id
}


func getUserDataUsingAsync(id: Int) async -> (String,Int) {
    sleep(2)
    let data = ("Giorgi",20)
    print("data is \(data)")
    return data
}

func getUserInfoUsingAsync(age: Int) async -> (String) {
    sleep(2)
    let info = age > 18 ? "🍺" : "🔞"
    return info
}


func makeUserCalls() async {
    let id = await getUserIdUsingAsync()
    let userData = await getUserDataUsingAsync(id: id)
    let userInfo = await getUserInfoUsingAsync(age: userData.1)
    print(userInfo)
}
Task {
    await makeUserCalls()
}
