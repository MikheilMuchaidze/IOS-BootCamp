//
//  ViewController.swift
//  Concurency
//
//  Created by Vasili Baramidze on 08.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let imageUrl = URL(string: "https://picsum.photos/200/300")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //on main thread (blocks ui)
    func getImageFromUrl() {
        
        guard let image = try? Data(contentsOf: imageUrl) else {
            return
        }
        DispatchQueue.global().async {
            sleep(4)
        }
        
        imageView.image = UIImage(data: image)
        
    }
    
    func getImageUsingUrl() {
        indicator.startAnimating()
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data else {
                return
            }
            print(Thread.current.isMainThread)
//            self.imageView.image = UIImage(data: data)
            
            DispatchQueue.main.async {
                print(Thread.current.isMainThread)
                self.imageView.image = UIImage(data: data)
                self.indicator.stopAnimating()
            }
        }.resume()
    }
    
    
    @IBAction func fetchImage(_ sender: Any) {
        getImageUsingUrl()
    }
    
    @IBAction func changeBackground(_ sender: Any) {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        view.backgroundColor = randomColor
    }
    
}

