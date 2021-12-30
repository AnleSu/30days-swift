//
//  StatCollectionViewCell.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/15.
//

import UIKit

class StatCollectionViewCell: UICollectionViewCell {
    var textLabel: UILabel!
    var detailLabel:UILabel!
    var lineView: UIView!
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
        textLabel.textAlignment = .left
        textLabel.font = UIFont.systemFont(ofSize: 17)
        self.contentView.addSubview(textLabel)
        
        detailLabel = UILabel()
        detailLabel.text = "10000"
        detailLabel.textColor = .black
        detailLabel.textAlignment = .right
        detailLabel.font = UIFont.systemFont(ofSize: 17)
        self.contentView.addSubview(detailLabel)
        
        lineView = UIView()
        lineView.backgroundColor = .secondarySystemBackground
        self.contentView.addSubview(lineView)
        
      
    }
    
    func createSubViewsConstraints() {
        textLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        detailLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.bottom.right.equalToSuperview()
        }
    }


}
