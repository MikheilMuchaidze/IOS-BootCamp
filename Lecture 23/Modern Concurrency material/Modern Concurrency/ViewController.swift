//
//  ViewController.swift
//  Modern Concurrency
//
//  Created by Vasili Baramidze on 15.08.22.
//

import UIKit

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

struct User: Codable{
    let id: Int
    let name: String
    let username: String
    let email: String
}

class ViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let semaphore = DispatchSemaphore(value: 1)
    var todos = [Todo]()

    let queue = DispatchQueue(label: "firstQueue",qos: .background)
    let secondQueue = DispatchQueue(label: "secondQueue",qos: .userInteractive)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        queue.async {
            self.semaphore.wait()
            self.getTodos { todosArray in
                sleep(5)
                self.todos = todosArray
                self.semaphore.signal()
            }
        }

        queue.async {
            self.semaphore.wait()
            self.getUserFor(todo: self.todos.randomElement()!.userId) { user in
                print(user)
                self.semaphore.signal()
                DispatchQueue.main.async {
                    self.indicator.stopAnimating()
                }
            }
        }
    }
    
    func getTodos(completion: @escaping ([Todo])-> Void) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let todos = try JSONDecoder().decode([Todo].self, from: data)
                print(todos)
                completion(todos)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getUserFor(todo: Int, completion: @escaping (User)-> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(todo)")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                print(user)
                completion(user)
            } catch {
                print(error)
            }
        }.resume()
    }
}

