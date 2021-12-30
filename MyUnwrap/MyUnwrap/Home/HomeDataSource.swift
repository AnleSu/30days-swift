//
//  HomeDataSource.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/10.
//

import Foundation
import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
    var badges:[Badge]!
    var sections = [HomeSection]()
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        let item = section.items[indexPath.row]
        
        switch section.type {
        case .status:
            switch item.type {
            case .status: //进度圈和星星
                return makeStatusCell(in: collectionView, indexPath: indexPath)
                
            case .summary:
                return makePointsCell(in: collectionView, indexPath: indexPath)
            default:
                fatalError("Invalid item type: \(item.type).")
            }
        case .score, .stats, .streak:
            return makeStatCell(in: collectionView, indexPath: indexPath)
       
        case .badges:
            return makeBadgeCell(in: collectionView, indexPath: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return makeHeader(in: collectionView, indexPath: indexPath)
        default:
            fatalError("Failed to dequeue a HeaderSupplementaryView.")
        }
    }
   
    
    override init() {
        super.init()
        //读取本地json文件 并解码成model
        guard let path = Bundle.main.path(forResource: "Badges", ofType: "json") else { return }
        let localData = NSData.init(contentsOfFile: path)! as Data
        do {
            self.badges = try JSONDecoder().decode([Badge].self, from: localData)
            updateSections()
        } catch {
            debugPrint("解析json失败")
        }
        
        
    }
    
    func updateSections() {
//       第0组 圆圈和points
        let statusSection = HomeSection(title: nil, type: .status, items: [HomeItem(name: nil, type: .status),
                                                                    HomeItem(name: nil, type: .summary)])
//       第4组 全是小图标
        let badgesSection = HomeSection(title: "BADGES", type: .badges, items: Array(repeating: HomeItem(name: nil, type: .badge), count: self.badges.count))
        
        sections = [statusSection, makeScoreSection(), makeStatsSection(), makeStreakSection(), badgesSection]

    }
//      第1组  TODO： detailLabel和accessibilityLabel最终要取用户的实际数据
    func makeScoreSection() -> HomeSection {
        let learningPoints = HomeItem(type: .stat(
            textLabel: "Learning Points",
            detailLabel: "0",
            accessibilityLabel: "points from learning"
        ))

        let reviewPoints = HomeItem(type: .stat(
            textLabel: "Review Points",
            detailLabel: "0",
            accessibilityLabel: "points from reviews"
        ))

        let practicePoints = HomeItem(type: .stat(
            textLabel: "Practice Points",
            detailLabel: "0",
            accessibilityLabel: "points from practicing"
        ))

        let challengePoints = HomeItem(type: .stat(
            textLabel: "Challenge Points",
            detailLabel: "0",
            accessibilityLabel: "points from challenges"
        ))

        return HomeSection(title: "POINTS", type: .score, items: [
            learningPoints,
            reviewPoints,
            practicePoints,
            challengePoints,
            HomeItem(type: .share)
        ])
    }
    
    private func makeStatsSection() -> HomeSection {
        let currentLevel = HomeItem(type: .stat(
            textLabel: "Current Level",
            detailLabel: "1/21",
            accessibilityLabel: "You are level 1 of 21."
        ))

        let dailyChallenges = HomeItem(type: .stat(
            textLabel: "Daily Challenges",
            detailLabel: "1",
            accessibilityLabel: "21 daily challenges completed."
        ))
        
        let pointsUnitl = HomeItem(type: .stat(
            textLabel: "Points Until Next Level",
            detailLabel: "N/A",
            accessibilityLabel: "You are at the maximum level."
        ))

        return HomeSection(title: "STATS", type: .stats, items: [
            currentLevel,
            pointsUnitl,
            dailyChallenges
        ])
    }
    
    private func makeStreakSection() -> HomeSection {
        let streakDays = HomeItem(name: "Streak Reminder", type: .stat(
            textLabel: "Current Streak",
            detailLabel: "1",
            accessibilityLabel: "Your streak count is 1"
        ))

        let bestStreak = HomeItem(name: "Streak Reminder", type: .stat(
            textLabel: "Best Streak",
            detailLabel: "1",
            accessibilityLabel: "Your best streak count is 1"
        ))

        return HomeSection(title: "STREAK", type: .streak, items: [
            streakDays,
            bestStreak
        ])
    }
    
    private func makeStatusCell(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatusCollectionViewCell", for: indexPath) as? StatusCollectionViewCell else {
            fatalError("Failed to dequeue a StatusCollectionViewCell.")
        
        }
        return cell
    }
    
    private func makePointsCell(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PointsCollectionViewCell", for: indexPath) as? PointsCollectionViewCell else {
            fatalError("Failed to dequeue a PointsCollectionViewCell.")
        
        }
        return cell
    }
    
    private func makeStatCell(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatCollectionViewCell", for: indexPath) as? StatCollectionViewCell else {
            fatalError("Failed to dequeue a StatCollectionViewCell.")
        
        }
        let item = sections[indexPath.section].items[indexPath.row]
        switch item.type {
        case .stat(let title, let detail, let accessibilityLabel):
            cell.textLabel.text = title
            cell.detailLabel.text = detail
            cell.accessibilityLabel = accessibilityLabel//ios的辅助功能 帮助视障人士使用App
        case .share:
            cell.textLabel.text = "Share Score"
            cell.textLabel?.textColor = UIColor(named: "Primary")
            
        default:
            fatalError("Invalid item type: \(item.type).")
        }
        return cell
    }
    
    private func makeBadgeCell(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BadgeCollectionViewCell", for: indexPath) as? BadgeCollectionViewCell else {
            fatalError("Failed to dequeue a BadgeCollectionViewCell.")
        
        }
        cell.badge = badges[indexPath.item]
        return cell
    }
    
    private func makeHeader(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as? HeaderSupplementaryView else {
            fatalError("Failed to dequeue a HeaderSupplementaryView.")
        }
        let section = sections[indexPath.section]
        view.textLabel.text = section.title
        if section.type == .badges {
            view.backgroundColor = .systemGroupedBackground
        }
        
        return view
    }
    
}
