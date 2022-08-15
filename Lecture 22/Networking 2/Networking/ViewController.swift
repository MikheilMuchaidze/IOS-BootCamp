//
//  ViewController.swift
//  Networking
//
//  Created by Vasili Baramidze on 10.08.22.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var folowers = [Follower]() {
        didSet {
            self.listTableView.reloadData()
        }
    }
    var memes = [MemesResponseData.DataModel.Meme]()
    var networService = NetworkService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listTableView.delegate = self
        listTableView.dataSource = self
//        networService.getMemes { response in
//            self.memes = response.data.memes
//            self.listTableView.reloadData()
//        }
        
////
        networService.getFolowers { allFollowers,error  in
            if let error = error {
                error
            }
                        
            guard let allFollowers = allFollowers else {
                return
            }

            self.folowers = allFollowers
            self.listTableView.reloadData()
        }
        
        networService.getData(urlString: "https://api.imgflip.com/get_memes#") { (item: MemesResponseData) in
            let memes = item.data.memes
            self.memes = memes
            self.listTableView.reloadData()
        }

//        networService.getData(urlString: "https://api.github.com/users/SAllen0400/followers") { (followers: [Follower]) in
//            self.folowers = followers
//
//            print(self.folowers)
//        }
        getWeatherForCoordinate()
    }
    
    func getWeatherForCoordinate() {
        let urlsString = "https://api.openweathermap.org/data/2.5/weather"

        var urlComponent = URLComponents(string: urlsString)
        
        urlComponent?.queryItems =  [
            URLQueryItem(name: "lat", value: "41.7151"),
            URLQueryItem(name: "lon", value: "44.8271"),
            URLQueryItem(name: "appid", value: "faaad98c5d2f17fcf553bf4e1141ee8c")
        ]
        
        var request = URLRequest(url: (urlComponent?.url!)!)
        request.httpMethod = "GET"
        
        networService.session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                print(json)
            } catch {
                print("Decode error")
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
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
    
}
