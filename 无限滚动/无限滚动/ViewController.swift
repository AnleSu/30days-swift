//
//  ViewController.swift
//  无限滚动
//
//  Created by Anlesu on 2021/11/24.
//

import UIKit

let baseURL = "https://robohash.org/"

protocol PreloadCellDelegate: NSObject {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var isFetchInProcess: Bool = false
    var total:Int = 0
    var currentPage:Int = 0
    var images: [ImageModel] = []
    
    //模拟分页请求
    func fetchImages() {
        guard !isFetchInProcess else {
            return
        }
        
        isFetchInProcess = true
        //延时2秒模拟网络环境
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 2) {
            print("+++++++++++ 模拟网络数据请求返回成功 +++++++++++")
            DispatchQueue.main.async {
                self.total = 1000
                self.currentPage += 1
                self.isFetchInProcess = false
                
                let imagesData = (1...30).map {
                    ImageModel(url: baseURL+"\($0)", order: $0)
                }
                self.images.append(contentsOf: imagesData)
                
                if self.currentPage > 1 {
                    
                }
                
            }
        }
    }


}

extension ViewController: PreloadCellDelegate {
    func onFetchFailed(with reason: String) {
        
    }
    
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
        
    }
}

class ImageModel {
    var url: URL?
    var order: Int?
    
    init(url: String, order: Int) {
        self.url = URL(string: url)
        self.order = order
    }
}

