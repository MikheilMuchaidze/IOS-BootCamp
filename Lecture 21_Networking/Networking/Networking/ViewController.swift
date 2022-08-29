//
//  ViewController.swift
//  Networking
//
//  Created by Vasili Baramidze on 10.08.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let currentMeme = memes[indexPath.row]
        cell.titleLbl.text = "\(currentMeme.id)"
        cell.subTitleLbl.text = currentMeme.name
        let url = currentMeme.url
        cell.memeImage.load(url: URL(string: url)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    @IBOutlet weak var listTableView: UITableView!
    
    var folowers = [Follower]() {
        didSet {
            self.listTableView.reloadData()
        }
    }
    var memes = [Meme]()
    var networService = NetworkService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listTableView.delegate = self
        listTableView.dataSource = self
        networService.getMemes { response in
            self.memes = response.data.memes
            self.listTableView.reloadData()
        }
        
        networService.getFolowers { allFollowers in
            self.folowers = allFollowers
        }
    }
}

