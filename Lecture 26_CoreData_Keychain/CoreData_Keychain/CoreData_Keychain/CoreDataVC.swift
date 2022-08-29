//
//  CoreDataVC.swift
//  CoreData_Keychain
//
//  Created by Vasili Baramidze on 24.08.22.
//

import UIKit

class CoreDataVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var cars: [Car] = []
    
    var names = [
        "BMW",
        "Fiat",
        "Mazda",
        "volvo"
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getCarData()
        
        let manufactureer = Manufacturer(context: managedContext)
        manufactureer.city = "Berlin"
        
        let car = Car(context: managedContext)
        car.model = "ferrari"
        
        manufactureer.addToCars(car)
    }
    //MARK: - private functions
    private func getCarData() {
        let fechedCars = try! managedContext.fetch(Car.fetchRequest())
        self.cars = fechedCars
        tableview.reloadData()
    }
    
    
    func getDataUsingPredicate() {
        let request = Car.fetchRequest()
        
//        request.predicate = NSPredicate(format: "model CONTAINS %@", "AUDI")
        
        let mulutiPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "model CONTAINS %@", "AUDI")
        ])
        
        request.predicate = mulutiPredicate
        
        let fechedCars = try! managedContext.fetch(request)
        
        
        self.cars = fechedCars
        tableview.reloadData()
    }
    
    //MARK: - actions
    @IBAction func addItem(_ sender: Any) {
        let newCar = Car(context: managedContext)
        newCar.model = names.randomElement()!
        newCar.maxSpeed = Int16.random(in: 200...300)
        
        try! managedContext.save()
        getCarData()
    }
    
    @IBAction func get(_ sender: Any) {
//        getCarData()
        getDataUsingPredicate()
    }
    
    @IBAction func edit(_ sender: Any) {
        let modelForEdit = cars.last!
        print("before edit = \(modelForEdit.maxSpeed)")
        modelForEdit.maxSpeed = 400
        
        try! managedContext.save()
        getCarData()
    }
    
    @IBAction func remove(_ sender: Any) {
        let carForRemove = cars.first!
        managedContext.delete(carForRemove)
        try! managedContext.save()
        getCarData()
    }
}
 
extension CoreDataVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
        let curentCar = cars[indexPath.row]
        cell.modelLbl?.text = curentCar.model
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
