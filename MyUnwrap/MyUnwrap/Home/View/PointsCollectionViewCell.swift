//
//  PointsCollectionViewCell.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/15.
//

import UIKit

class PointsCollectionViewCell: UICollectionViewCell, Reusable {
    var textLabel: UILabel!
    var pointsLabel:UILabel!
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        createSubViews()
        createSubViewsConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    func createSubViews() {
        textLabel = UILabel()
        textLabel.text = "POINTS"
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        self.contentView.addSubview(textLabel)
        
        pointsLabel = UILabel()
        pointsLabel.text = "10000"
        pointsLabel.textColor = .black
        pointsLabel.textAlignment = .center
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 48)
        self.contentView.addSubview(pointsLabel)
    }
    
    func createSubViewsConstraints() {
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
        pointsLabel.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        pointsLabel.snp.makeConstraints { [weak self] make in
            guard let self = self else { return }
            make.top.equalTo(self.textLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
    }

    
}
