//
//  ViewController+TableView.swift
//  CollectionView
//
//  Created by Vasili Baramidze on 13.07.22.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let country = difDataSource.itemIdentifier(for: indexPath)
        print(country?.name)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 150)
    }
}
