//
//  ViewController.swift
//  16-day 3D Touch
//
//  Created by Anlesu on 2021/10/27.
//

import UIKit
import SafariServices


/**
 *app内的视图 要实现3D Touch
 *所在的VC要实现UIViewControllerPreviewingDelegate
 *对视图 注册3D Touch  registerForPreviewing  但是这个方法在iOS13之后弃用了  改用UIContextMenuInteraction(UIContextMenuInteractionDelegate)实现
 *实现的时候要对系统做判断  否则系统大于13  用registerForPreviewing无效
 */
class ViewController: UIViewController, UIViewControllerPreviewingDelegate, UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
//        let favorite = UIAction(title: "favorite", image: UIImage(systemName: "heart.fill"), identifier: UIAction.Identifier("heart.fill"), discoverabilityTitle: nil, attributes: [], state: .off) { (action) in
//            print("favorite")
//        }
//
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
//            UIMenu(title: "menu", image: nil, identifier: nil, options: .destructive, children: [favorite])
//        }
        
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (elements) -> UIMenu? in
//            let favoriteAction = UIAction(title: "喜欢", image: UIImage(systemName: "heart.fill"), state: .off) { (action) in
//
//            }
//            let shareAction = UIAction(title: "分享", image: UIImage(systemName: "square.and.arrow.up.fill"), state: .off) { (action) in
//
//            }
//            let deleteAction = UIAction(title: "删除", image: UIImage(systemName: "trash.fill"),
//                                        attributes: [.destructive], state: .off) { (action) in
//
//            }
//            return UIMenu(title: "菜单", children: [favoriteAction, shareAction, deleteAction])
//        }
        
        //二级菜单
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (elements) -> UIMenu? in
//
//                    // 二级action数组
//                    var ratingActions: Array<UIAction> = []
//                    // 遍历增加5个action
//                    for i in 0..<5 {
//                        let action = UIAction(title: "\(i+1) 分") { (action) in
//
//                        }
//                        ratingActions.append(action)
//                    }
//                    // 创建一个打分的菜单
//                    let ratingMenu = UIMenu(title: "打分", image: UIImage(systemName: "star.circle"), children: ratingActions)
//
//                    let favoriteAction = UIAction(title: "喜欢", image: UIImage(systemName: "heart.fill"), state: .off) { (action) in
//
//                    }
//                    let shareAction = UIAction(title: "分享", image: UIImage(systemName: "square.and.arrow.up.fill"), state: .off) { (action) in
//
//                    }
//                    let deleteAction = UIAction(title: "删除", image: UIImage(systemName: "trash.fill"),
//                                                attributes: [.destructive], state: .off) { (action) in
//
//                    }
//                    // 将打分的菜单放到一级菜单里面。
//                    return UIMenu(title: "菜单", children: [ratingMenu, favoriteAction, shareAction, deleteAction])
//                }
        
        


      //分组菜单  将删除单独归到一组，只需将删除的action包装到UIMenu中，并设置UIMenu的Options属性为displayInline即可
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (elements) -> UIMenu? in
//
//                    // 二级action数组
//                    var ratingActions: Array<UIMenuElement> = []
//                    // 遍历增加5个action
//                    for i in 0..<5 {
//                        let action = UIAction(title: "\(i+1) 分") { (action) in
//
//                        }
//                        ratingActions.append(action)
//                    }
//                    // 创建一个打分的菜单
//                    let ratingMenu = UIMenu(title: "打分", image: UIImage(systemName: "star.circle"), children: ratingActions)
//
//                    let favoriteAction = UIAction(title: "喜欢", image: UIImage(systemName: "heart.fill"), state: .off) { (action) in
//
//                    }
//                    let shareAction = UIAction(title: "分享", image: UIImage(systemName: "square.and.arrow.up.fill"), state: .off) { (action) in
//
//                    }
//
//                    let deleteAction = UIAction(title: "删除", image: UIImage(systemName: "trash.fill"),
//                                                attributes: [.destructive], state: .off) { (action) in
//
//                    }
//                    // 创建一个delete menu，然后设置options属性为displayInline，并将上面的deleteAction添加进来。
//                    let deleteMenu = UIMenu(title: "删除菜单", options: .displayInline, children: [deleteAction])
//                    // 将打分的菜单放到一级菜单里面。
//                    return UIMenu(title: "菜单", children: [ratingMenu, favoriteAction, shareAction, deleteMenu])
//                }

      
       //显示预览视图
        return UIContextMenuConfiguration(identifier: nil) {
            let detailVC = DetailViewController()
            detailVC.image = UIImage(named: "fingerprint")
            detailVC.preferredContentSize = CGSize(width: 280, height: 360)
            return detailVC
        } actionProvider: { [weak self] (elements) -> UIMenu? in
            return self?.createMenu()
        }
       
    }
    /*!
     * 当用户点击预览图的时候调用，相当于3DTouch里面的Pop功能。
     *
     * @param interaction    当前的交互对象
     * @param configuration  当前的配置项
     * @param animator       跳转动画执行者，可以给它添加跳转动画。

    */
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
        animator.addCompletion {
            let detailVC = DetailViewController()
            detailVC.image = UIImage(named: "fingerprint")
            self.show(detailVC, sender: self)
            
        }
    }
    
    func createMenu() ->  UIMenu?{
        let shareAction = UIAction(title: "分享", image: UIImage(systemName: "square.and.arrow.up.fill"), state: .off) { (action) in
                           }
        return UIMenu(title: "菜单", children: [shareAction])
    }
    
    var actionLabel: UILabel!
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        // 通过上下文可以调整不被虚化的范围
        previewingContext.sourceRect = CGRect(x: 10, y: 10, width: self.view.frame.width - 20, height: self.view.frame.height - 10)
        return SFSafariViewController(url: NSURL(string: "http://www.qq.com")! as URL)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.show(viewControllerToCommit, sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .lightGray
        actionLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 400, height: 50))
        actionLabel.text = "Please Press the 3D action"
        self.view.addSubview(actionLabel)
        
        let fingerImgView = UIImageView(frame: CGRect(x: 10, y: 10, width: 128, height: 128))
        fingerImgView.image = UIImage(named: "fingerprint")
        fingerImgView.isUserInteractionEnabled = true
        self.view.addSubview(fingerImgView)
        fingerImgView.center = self.view.center
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotifi(sender:)), name: NSNotification.Name("ShortcutItem"), object: nil)
        
        //ios 13之前
        self.registerForPreviewing(with: self, sourceView: self.view)
        
        //ios13之后
        let interaction = UIContextMenuInteraction(delegate: self)
        fingerImgView.addInteraction(interaction)
        
    }
    
    @objc func handleNotifi(sender: Notification) {
        let shortcutItem = sender.userInfo?["shortcutItem"] as! UIApplicationShortcutItem
        if shortcutItem.type == "play" {
            actionLabel.text = "Yes, I do ❤️ you!"
        }
    }


}


extension SFSafariViewController {
    open override var previewActionItems: [UIPreviewActionItem] {
        let deleteAction = UIPreviewAction(title: "删除", style: .destructive) { (previewAction, vc) in
            print("Delete")
        }
        let doneAction = UIPreviewAction(title: "完成", style: .default) { (previewAction, vc) in
            print("Done")
        }
        return [deleteAction,doneAction]
    }
}
