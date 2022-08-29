//
//  ViewController.swift
//  Col}ectionView
//
//  Created by Vasili Baramidze on 12.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section {
        case one
    }
    
    @IBOutlet weak var countriesCollectionView: UICollectionView!
    
    var myCountries = [Country]()
    
    var difDataSource: UICollectionViewDiffableDataSource<Section,Country>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureCollectionView()
    }
    
    func configureCollectionView() {
        countriesCollectionView.delegate = self
        countriesCollectionView.registerNib(class: CountryCell.self)
        
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.minimumLineSpacing = 40
        customFlowLayout.scrollDirection = .horizontal
        countriesCollectionView.collectionViewLayout = customFlowLayout
        
        createDifDatasource()
    }
    
    func createDifDatasource() {
        difDataSource = UICollectionViewDiffableDataSource(collectionView: countriesCollectionView, cellProvider: { collectionView, indexPath, country in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCell", for: indexPath) as! CountryCell
            cell.country = self.myCountries[indexPath.row]
            return cell
        })
    }
    
    @IBAction func addCountry(_ sender: Any) {
        if Country.allCountry.count > myCountries.count {
            myCountries.append(Country.allCountry[myCountries.count])
        } else {
            let chinaWithNewUUID = Country(id: Country.allCountry.first!.id,
                                           name: Country.allCountry.first!.name,
                                           population: Country.allCountry.first!.population)
            myCountries.append(chinaWithNewUUID)
        }
        updatedataSource()
    }
    
    func updatedataSource() {
        var screenshot = NSDiffableDataSourceSnapshot<Section,Country>()
        screenshot.appendSections([.one])
        screenshot.appendItems(myCountries, toSection: .one)
        difDataSource.apply(screenshot)
    }
}
