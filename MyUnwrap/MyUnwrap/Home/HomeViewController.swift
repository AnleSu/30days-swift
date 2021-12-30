//
//  HomeViewController.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/8.
//

import UIKit

class HomeViewController: UICollectionViewController, StoryBoarded {
    var coordinator: HomeCoordinator?
    var dataSource = HomeDataSource()
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        collectionView.dataSource = dataSource
        collectionView.collectionViewLayout = makeLayout()
        collectionView.backgroundColor = .systemGroupedBackground
        
//        自定义cell 三部曲  1.封装cell后在collectionView的delegate中返回对应cell 2.collectionView为封装的cell赋值layout 3.register
        collectionView.register(StatusCollectionViewCell.self, forCellWithReuseIdentifier: "StatusCollectionViewCell")
        collectionView.register(PointsCollectionViewCell.self, forCellWithReuseIdentifier: "PointsCollectionViewCell")
        collectionView.register(StatCollectionViewCell.self, forCellWithReuseIdentifier: "StatCollectionViewCell")
        collectionView.register(BadgeCollectionViewCell.self, forCellWithReuseIdentifier: "BadgeCollectionViewCell")
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
    }
    
    func makeLayout() -> UICollectionViewLayout {
        //组合布局
        let layout = UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            switch self.dataSource.sections[section].type {
            case .status:
                return self.statusSection()
            case .score:
                return self.storeSection()
            case .stats:
                return self.statsSection()
            case .streak:
                return self.streakSection()
            case .badges:
                return self.badgesSection()
            }
            
        }
        //badge部分的白背景
        layout.register(BackgroundSupplementaryView.self, forDecorationViewOfKind: "background")
        return layout
    }
    
    private func statusSection() -> NSCollectionLayoutSection {
        //fractionalWidth(1) 宽度是容器宽度的1倍 就是和容器一样宽  .estimated(400)预估高度400
        let statusSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(400))
        let status = NSCollectionLayoutItem(layoutSize: statusSize)
        //.absolute(90)  表示将元素的宽或者高写死一个绝对的值
        let pointsSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(90))
        let points = NSCollectionLayoutItem(layoutSize: pointsSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(490))
        //垂直方向上 组合布局
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [status, points])

        return NSCollectionLayoutSection(group: group)
    }
    
    private func storeSection() -> NSCollectionLayoutSection {
        let itemHeight: CGFloat = 44
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(itemHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let itemsCount = dataSource.sections.first(where: {$0.type == .score})?.items.count ?? 0
        let groupHeight = itemHeight * CGFloat(itemsCount)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(groupHeight))
        //每一行的size  一共多少行
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: itemsCount)
        
        let section = NSCollectionLayoutSection(group: group)
        //设置头尾
        section.boundarySupplementaryItems = [header()]
        return section
    }
    
    private func statsSection() -> NSCollectionLayoutSection {
        let itemHeight: CGFloat = 44
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(itemHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let itemsCount = dataSource.sections.first(where: {$0.type == .stats})?.items.count ?? 0
        let groupHeight = itemHeight * CGFloat(itemsCount)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(groupHeight))
        //每一行的size  一共多少行
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: itemsCount)
        
        let section = NSCollectionLayoutSection(group: group)
        //设置头尾
        section.boundarySupplementaryItems = [header()]
        return section
    }
    
    private func streakSection() -> NSCollectionLayoutSection {
        let itemHeight: CGFloat = 44
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(itemHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let itemsCount = dataSource.sections.first(where: {$0.type == .streak})?.items.count ?? 0
        let groupHeight = itemHeight * CGFloat(itemsCount)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(groupHeight))
        //每一行的size  一共多少行
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: itemsCount)
        
        let section = NSCollectionLayoutSection(group: group)
        //设置头尾
        section.boundarySupplementaryItems = [header()]
        return section
    }
    
    private func badgesSection() -> NSCollectionLayoutSection {
        let size:CGFloat = 60
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(size), heightDimension: .absolute(size))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(size))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 24, trailing: 0)
        section.interGroupSpacing = 16
        section.boundarySupplementaryItems = [header()]
        
        let background = NSCollectionLayoutDecorationItem.background(elementKind: "background")
        section.decorationItems = [background]

        return section
    }
    
    private func header() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(56)),
                                                           elementKind: UICollectionView.elementKindSectionHeader,
                                                           alignment: .top)
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let section = dataSource.sections[indexPath.section]
        let item = section.items[indexPath.row]
//        switch 可以同时判断两个值
        switch (section.type, item.type) {
        case (.score, .share):
            guard let attributes = collectionView.layoutAttributesForItem(at: indexPath) else {
                return
            }
            //调用相应点击方法 方法实现可以在vm中
        default:
            return
            
        }
    }
    
    
}
