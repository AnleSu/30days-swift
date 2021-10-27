//
//  ViewController.swift
//  13-day GCD的学习
//
//  Created by Anlesu on 2021/10/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    let cellIdentifier = "withIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createSubViews()
        // Do any additional setup after loading the view.
        //任务如何执行 有两个决定因素 1.是队列 2.同步or异步
        /**
         *调度工作项：其实就是一项任务，可以把你想要执行的代码写成闭包，在DispatchWorkIte
         *初始化时传进去，方便后续管理任务，并且会让代码更整洁。
         */
        let item1: DispatchWorkItem = DispatchWorkItem {
            for i in 0...4 {
                print("item1 \(i) thread: \(Thread.current)")
            }
        }
        
        let item2: DispatchWorkItem = DispatchWorkItem {
            for i in 0...4 {
                print("item2 \(i) thread: \(Thread.current)")
            }
        }
        
        let item3: DispatchWorkItem = DispatchWorkItem {
            for i in 0...4 {
                print("item3 \(i) thread: \(Thread.current)")
            }
        }
        
        let item4: DispatchWorkItem = DispatchWorkItem {
            for i in 0...4 {
                print("item4 \(i) thread: \(Thread.current)")
            }
        }
        
//        let item2: DispatchWorkItem = DispatchWorkItem(qos: .userInteractive, flags: .barrier) {
//            print("item2 : 指定qos（执行优先级）或flags（特殊行为标记）")
//        }
        
        
//        主队列 异步任务
        let mainQ = DispatchQueue.main
//        mainQ.async(execute: item1)
//        mainQ.async(execute: item2)
//        mainQ.async(execute: item3)
//        mainQ.async(execute: item4)
//        在主线程里 顺序执行四个DispatchWorkItem中的任务
        /**
         *item1 0 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item1 1 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item1 2 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item1 3 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item1 4 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item2 0 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item2 1 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item2 2 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item2 3 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item2 4 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item3 0 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item3 1 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item3 2 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item3 3 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item3 4 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item4 0 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item4 1 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item4 2 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item4 3 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         item4 4 thread: <_NSMainThread: 0x6000037f8340>{number = 1, name = main}
         */
//    全局队列 异步任务
        let globalQ = DispatchQueue.global()
//        globalQ.async(execute: item1)
//        globalQ.async(execute: item2)
//        globalQ.async(execute: item3)
//        globalQ.async(execute: item4)
//        在多个线程里 随机执行每个DispatchWorkItem中的任务 且不会一次性把一个DispatchWorkItem中的任务执行完
        /**
         *item1 0 thread: <NSThread: 0x600003ccdf80>{number = 5, name = (null)}
         item2 0 thread: <NSThread: 0x600003cbbc80>{number = 2, name = (null)}
         item3 0 thread: <NSThread: 0x600003cb3bc0>{number = 3, name = (null)}
         item4 0 thread: <NSThread: 0x600003cd4380>{number = 6, name = (null)}
         item3 1 thread: <NSThread: 0x600003cb3bc0>{number = 3, name = (null)}
         item4 1 thread: <NSThread: 0x600003cd4380>{number = 6, name = (null)}
         item3 2 thread: <NSThread: 0x600003cb3bc0>{number = 3, name = (null)}
         item4 2 thread: <NSThread: 0x600003cd4380>{number = 6, name = (null)}
         item3 3 thread: <NSThread: 0x600003cb3bc0>{number = 3, name = (null)}
         item4 3 thread: <NSThread: 0x600003cd4380>{number = 6, name = (null)}
         item3 4 thread: <NSThread: 0x600003cb3bc0>{number = 3, name = (null)}
         item4 4 thread: <NSThread: 0x600003cd4380>{number = 6, name = (null)}
         item2 1 thread: <NSThread: 0x600003cbbc80>{number = 2, name = (null)}
         item1 1 thread: <NSThread: 0x600003ccdf80>{number = 5, name = (null)}
         item2 2 thread: <NSThread: 0x600003cbbc80>{number = 2, name = (null)}
         item1 2 thread: <NSThread: 0x600003ccdf80>{number = 5, name = (null)}
         item2 3 thread: <NSThread: 0x600003cbbc80>{number = 2, name = (null)}
         item2 4 thread: <NSThread: 0x600003cbbc80>{number = 2, name = (null)}
         item1 3 thread: <NSThread: 0x600003ccdf80>{number = 5, name = (null)}
         item1 4 thread: <NSThread: 0x600003ccdf80>{number = 5, name = (null)}

         */
//
//        /**
//         *自定义队列 默认串行
//         */
//        串行队列 异步任务
        let serialQ = DispatchQueue(label: "serialQ")
//        serialQ.async(execute: item1)
//        serialQ.async(execute: item2)
//        serialQ.async(execute: item3)
//        serialQ.async(execute: item4)
//        在一个线程里  顺序执行
        /**
         *item1 0 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item1 1 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item1 2 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item1 3 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item1 4 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item2 0 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item2 1 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item2 2 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item2 3 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item2 4 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item3 0 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item3 1 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item3 2 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item3 3 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item3 4 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item4 0 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item4 1 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item4 2 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item4 3 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}
         item4 4 thread: <NSThread: 0x6000023777c0>{number = 3, name = (null)}

         */
//      自定义并发队列  异步任务
        let concurrentQ = DispatchQueue(label: "test", attributes: .concurrent)
//        concurrentQ.async(execute: item1)
//        concurrentQ.async(execute: item2)
//        concurrentQ.async(execute: item3)
//        concurrentQ.async(execute: item4)
//     同globalQ
        
        
//        item 调用 notify 通知到主线程处理事件
//        item1.notify(queue: DispatchQueue.main) {
//
//        }
        createBasicOperation()
        operationStudy()
    }
    
    func createSubViews() {
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 66
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        self.view.addSubview(self.tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Basic Demo\n基本应用"
            break
        case 1:
            cell.textLabel?.text = "Priority Demo\n设置了Operation优先级的小案例"
            break
        case 2:
            cell.textLabel?.text = "Dependency Demo\n设置了依赖关系"
            break
        case 3:
            cell.textLabel?.text = "Collection Demo\n展示子线程加载图片"
            break
        default:
            break
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nav = UINavigationController(rootViewController: BasicViewController())
        self .present(nav, animated: true, completion: nil)
    }
    
    func operationStudy() {
        let op = Operation()
        op.completionBlock = {
            print(#function, #line, Thread.current)//<NSThread: 0x60000167de00>{number = 7, name = (null)}
        }
        let opQ = OperationQueue()
        opQ.addOperation(op)
    }
    
    func createBasicOperation() {
        let op = BlockOperation {
            print(#function, #line, Thread.current)//<_NSMainThread: 0x600001620700>{number = 1, name = main}
        }
        //直接运行operation，会在主线程中运行
        op.start()
    }


}

//dispatch_once 在 Swift 中已被废弃，可以用类型属性或者全局变量/常量来达到lazy + dispatch_once 效果
fileprivate let initTask2: Void = { print("initTask2")}()
class Data {
    static let initTask1: Void = {
        print("initTask1")
    }()
    
    init() {
        // 该方法只会被实现一次
        let _ = Self.initTask1
        let _ = initTask2
    }
}


