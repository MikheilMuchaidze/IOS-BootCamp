//
//  Extensions.swift
//  CollectionView
//
//  Created by Vasili Baramidze on 12.07.22.
//

import UIKit

extension UICollectionViewCell {
    
    static var identifier: String { String(describing: self) }
    static var nibFile: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}

extension UICollectionView {
    
    func registerNib<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.nibFile, forCellWithReuseIdentifier: T.identifier)
    }
}

extension CGSize {
    init(square: Double) {
        self.init(width: square, height: square)
    }
}
