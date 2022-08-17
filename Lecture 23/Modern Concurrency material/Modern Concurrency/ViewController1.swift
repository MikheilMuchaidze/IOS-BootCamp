//
//  ViewController1.swift
//  Modern Concurrency
//
//  Created by Vasili Baramidze on 15.08.22.
//

import UIKit

actor CustomEvent {
    
    let location = "Tbilisi sport palace"
    var availableSeats = ["A","B","C","D","E"]
    
    func getAvailableSeats() -> [String] {
        print(availableSeats)
        return availableSeats
    }
    
    func buyTicket() -> String {
        let firstElement = availableSeats.first!
        print("გაიყიდა ➡️ \(firstElement) ")
        availableSeats.removeFirst()
        return firstElement
    }
}

class ViewController1: UIViewController {

    @IBOutlet weak var seatNumberLbl: UILabel!
    
    let semaphore = DispatchSemaphore(value: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let someEvent = CustomEvent()
        
        DispatchQueue.global().async {
            Task {
                let seat = await someEvent.buyTicket()
                updateLbl(seat: seat)
            }
        }
        
        DispatchQueue.global().async {
            Task {
                let seats = await someEvent.getAvailableSeats()
            }
        }
        
        @MainActor
        func updateLbl(seat: String){
            self.seatNumberLbl.text = seat
        }
    }
}
