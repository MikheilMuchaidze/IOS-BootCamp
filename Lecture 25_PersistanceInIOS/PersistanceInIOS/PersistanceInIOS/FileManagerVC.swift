//
//  FileManagerVC.swift
//  PersistanceInIOS
//
//  Created by Vasili Baramidze on 22.08.22.
//

import UIKit

class FileManagerVC: UIViewController {

    let imageUrl = URL(string: "https://picsum.photos/200/300")

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let manager = FileManager.default
        var allurls = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        allurls!.appendPathComponent("my_second_Createdfolder")
        //ახალი საქაღალდე 🗂
        do {
            try? manager.createDirectory(
                at: allurls!,
                withIntermediateDirectories: true
            )
        } catch {
            print(error)
        }
        
        //ახალი ფაილი 📁
        allurls!.appendPathComponent("imageFolder")
//        let textData = "რაიმე ახალი ტექსტი".data(using: .utf8)!
 
//        manager.createFile(atPath: allurls!.path,
//                           contents: textData,
//                           attributes: nil
//        )
        //🌄 ფოტოს შენახვა
        DispatchQueue.main.async {
            do {
                let data = try Data(contentsOf: self.imageUrl!)
                
                manager.createFile(atPath: allurls!.path,
                                   contents: data,
                                   attributes: nil
                )
            } catch {
                print(error)
            }
        }
    }
}
