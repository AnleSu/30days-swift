//
//  HeaderSupplementaryView.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/10.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView, Reusable {
    var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        textLabel = UILabel()
        textLabel.textColor = UIColor.darkGray
        textLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(textLabel)
        
        textLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 0))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
