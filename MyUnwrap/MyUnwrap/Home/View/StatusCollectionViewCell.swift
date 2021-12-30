//
//  StatusCollectionViewCell.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/15.
//

import UIKit
import MKRingProgressView
import SnapKit
class StatusCollectionViewCell:UICollectionViewCell, Reusable {
    var statusView: StatusView!
    var lineView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        statusView = StatusView()
        statusView.strokeColorStart = UIColor(named: "Rank-Start")!
        statusView.strokeColorEnd = UIColor(named: "Rank-End")!
        statusView.shadowOpacity = 0
        statusView.currentRankFraction = 1
        self.addSubview(statusView)
        
        lineView = UIView()
        lineView.backgroundColor = .secondarySystemBackground
        self.addSubview(lineView)
        
        statusView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//封装圆圈中间带星星的view
class StatusView: UIImageView {
    var strokeColorStart = UIColor.black
    
    var strokeColorEnd = UIColor.black
    
    var lineWidth: CGFloat = 10
    
    var shadowOpacity:CGFloat = 0
    
    private let ringProgressView = RingProgressView()
    
    private var imageView: UIImageView!
    
    var useTemplateImages = false
    
    var currentRankFraction: Double = 0//TODO  最后取用户的数据
    
    var currentTotalPoints = 0
    
    var animatiePastEnd = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if imageView == nil {
            ringProgressView.startColor = strokeColorStart
            ringProgressView.endColor = strokeColorEnd
            ringProgressView.backgroundRingColor = UIColor(named: "StatusViewRingBackground")//color set
            ringProgressView.ringWidth = lineWidth
            ringProgressView.shadowOpacity = shadowOpacity
            addSubview(ringProgressView)
            
            imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "Rank Level \(2)")
            addSubview(imageView)
            
            ringProgressView.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 15, left: 35, bottom: 15, right: 35))
            }
            imageView.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 40, left: 40, bottom: 40, right: 40))
            }
            
           
            
        }
    }
}
