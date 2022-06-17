import UIKit
import CoreGraphics

//func myFunc(param:Int) -> Int {
//    return param * param
//}
////将上面的函数用闭包实现
//let myClosures = {(param:Int) -> Int in
//    return param * param
//}
////闭包可省略返回值
//let myClosures1 = {(param:Int) in
//    return param * param
//}
//
//myClosures1(3)
////通过实现一个排序函数来深入理解闭包
//func mySort(array: inout Array<Any>, sortClosure:(Int, Int) -> Bool) -> Array<Any> {
//    guard !array.isEmpty else { return [] }
////    //冒泡排序算法
////    for indexI in array.indices {
////        //最后一个元素直接返回
////        if indexI == array.count - 1 {
////            break
////        }
////        //冒泡排序
////        for indexJ in 0...((array.count - 1) - indexI - 1) {
////            if sortClosure(indexJ, indexJ + 1) {
////
////            } else {
////                //元素交换
//////                array.swapAt(indexJ, indexJ + 1)
////            }
////        }
////    }
//    for i in 0..<array.count {
//        for j in 0..<array.count - i - 1 {
//            if sortClosure(j, j + 1) {
//                let tmp = array[j]
//                array[j] = array[j + 1]
//                array[j + 1] = tmp
//            }
//        }
//    }
//    return array
//}

//var array: Array<Any> = [1, 4, 3, 5, 7, 2, 6]
//mySort(array: &array, sortClosure:{ (index:Int, nextIndex:Int) -> Bool in
//    return (array[index] as! Int) > (array[nextIndex] as! Int)
//})
//print(array)
//struct Point {
//    var x:Double
//    var y:Double
//}
//
//class PointC {
//    var x:Double
//    var y:Double
//    init(x:Double, y:Double) {
//        self.x = x
//        self.y = y
//    }
//}
//let point = Point(x: 2, y: 1)
//错误示范
//point.x = 33//Cannot assign to property: 'point' is a 'let' constant

//let point2 = PointC(x: 3, y: 3)
//point2.x = 88
//
//class Circle {
//    var r:Double {
//        willSet {
//            print("\(newValue)")
//        }
//        didSet {
//            print("\(oldValue)")
//        }
//
//    }
//    var center:(Double, Double)
//    static var sl:String = "static string"
//    var l:Double {
//        get {
//            return 2 * r * Double.pi
//        }
//        set {
//            r = newValue / 2 / Double.pi
//        }
//    }
//    var s:Double {
//        get {
//            return Double.pi * r * r
//        }
//        set {
//            r = sqrt(newValue / Double.pi)
//        }
//    }
//    init(r:Double, center:(Double, Double)) {
//        self.r = r
//        self.center = center
//    }
//}
//
//var c = Circle(r: 3, center: (3,3))
//Circle.sl
//
//class MyClass {
//    var name:String = "jj"
//    lazy var closure:() -> Void = {
//        [unowned self]() -> Void in
//            print(self.name)
//    }
//    deinit {
//        print("MyClass deinit")
//    }
//}
//
//var obj:MyClass? = MyClass()
//obj!.closure()
//obj = nil
//
//enum MyError:Error {
//    case DesTroyError
//    case NormalError
//    case SimpleError
//}
//func MyErrorFunc(param:Bool) throws -> Void {
//    if param {
//        print("success")
//    } else {
//        throw MyError.NormalError
//    }
//}
//
//do {
//    try MyErrorFunc(param: false)
//} catch MyError.SimpleError {
//
//} catch MyError.NormalError {
//    print("NormalError")
//} catch MyError.DesTroyError {
//
//} catch {
//
//}
//if let _ = try? MyErrorFunc(param: false) {
//    print("success")
//} else {
//    print("fail")
//}
//
////try! MyErrorFunc(param: false)
//
//func MyDeferFunc() throws -> Void{
//    defer {
//        print("finish")
//    }
//    print("handle")
//    throw MyError.NormalError
//}

class BaseClass {
}
//class MyClass : BaseClass {
//    var count:Int?
//}
//class MyClassOne : BaseClass {
//
//}
//var cl1 = BaseClass()
//var cl2 = MyClass()
//cl2.count = 99
//var cl3 = MyClassOne()
//var array:[BaseClass] = [cl1, cl2, cl3]
//for i in 0..<array.count {
//    var obj = array[i]
//    if obj is MyClass {
//        print((obj as! MyClass).count!)
//
//    }
//}
//if cl1 is MyClass {
//    print("父类进行子类类型的检查不可以成功")
//}
//if cl2 is BaseClass {
//    print("子类进行父类类型的检查可以成功")
//}

//func exchange<T>(param1: inout T , param2: inout T) {
//    let tmp = param1
//    param1 = param2
//    param2 = tmp
//}
protocol MyProtocal {
    
}
struct Stack<ItemType> {
    var items:[ItemType] = []
    mutating func push(param:ItemType) {
        self.items.append(param)
    }
    mutating func pop() -> Void {
        self.items.removeLast()
    }
}
var obj = Stack<Int>()
obj.push(param: 5)
var objS = Stack<String>()
objS.push(param: "hi")

class MyClassTC<T, C> where T:MyProtocal,C:MyProtocal {
    var param1:T
    var param2:C
    init(param1:T, param2:C) {
        self.param2 = param2
        self.param1 = param1
    }
}
