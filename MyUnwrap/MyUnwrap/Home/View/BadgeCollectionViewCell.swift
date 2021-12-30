//
//  BadgeCollectionViewCell.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/16.
//

import UIKit

class BadgeCollectionViewCell: UICollectionViewCell, Reusable {
    var imageView: UIImageView!
    //注意这里的写法 guard
    var badge: Badge? {
        didSet {
            guard let badge = badge else {
                return
            }

            imageView.image = badge.image
        }
    }
    override init(frame:CGRect){
        super.init(frame: frame)
        createSubViews()
        createSubViewsConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    func createSubViews() {
        self.backgroundColor = .white
       imageView = UIImageView()
        imageView.tintColor = UIColor(hexString: "e5e5e5")
        imageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(imageView)
    }
    
    func createSubViewsConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
