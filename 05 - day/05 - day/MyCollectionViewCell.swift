//
//  MyCollectionViewCell.swift
//  05 - day
//
//  Created by Anlesu on 2021/1/18.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionContent: UILabel!
    
    var model: CollectionModel! {
        didSet {
            imageView.image = model.image
            title.text = model.title
            descriptionContent.text = model.descriptionContent
        }
    }
    
    
    
}
