import UIKit

var greeting = "Hello, playground"

//MARK: - Serial
//DispatchQueue.main
//DispatchQueue.global()
//
let queue1 = DispatchQueue(label: "myQueue")

//queue1.sync {
//    print("1🟢")
//    for _ in 1...1000{
//        1+1
//    }
//    print("1🔴")
//}
//
//
//queue1.sync {
//    print("2🟢")
//    for _ in 1...1000{
//        1+1
//    }
//    print("2🔴")
//}

//MARK: - Concurent
//let concurentQueue = DispatchQueue(label: "Concurent.queue.name",attributes: .concurrent)
//
//concurentQueue.async {
//    print("1🟢")
//    for _ in 1...1001{
//        1+1
//    }
//    print("1🔴")
//}
//
//
//concurentQueue.async {
//    print("2🟢")
//    for _ in 1...1000{
//        1+1
//    }
//    print("2🔴")
//}


let group = DispatchGroup()
let backgroundQueue = DispatchQueue.global()


backgroundQueue.async(group: group) {
    sleep(1)
    print("1")
}

backgroundQueue.async(group: group) {
    sleep(5)
    print("5")
}

backgroundQueue.async(group: group) {
    sleep(3)
    print("3")
}
print("🔴")
