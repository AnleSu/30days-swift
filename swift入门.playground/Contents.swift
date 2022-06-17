import Cocoa
//
//var str = "Hello, playground"
//
//let π:Double = 3.14
//
////var name:String
////print(name) //Variable 'name' used before being initialized
//可选值类型
var obj1:Int? = 1
var obj2:Int? = 2
//if-let语法结构来进行optional类型值的绑定操作
if let tmp1 = obj1, let tmp2 = obj2, tmp1 < tmp2 {
print(tmp1, tmp2)
    }
//// 这是单行注释
//
///*
//这是多行注释的第一行
//这是多行注释的第二行
//*/
//
///* 多行套用注释，外部
//code
///* 多行套用注释，内部 */
//code
//多行套用注释，外部 */
//
var str:String = "hello"
str = ""
str = String()
str = String("hello")
str = String(666)
str = String(0.1)
str = String("a")//通过字符构造
str = String(true)
str = String(describing: (1, 1, "hh"))//通过元祖构造
str = String(format: "hh%@", "jj")//通过格式化字符串构造
var d = "hello \(123)"
var c = "hello \(d)"


MemoryLayout<String>.size
MemoryLayout<Character>.size
MemoryLayout<UInt>.size
MemoryLayout<Float>.size
MemoryLayout<Double>.size
MemoryLayout<Bool>.size
///** +、+=， 拼合字符串 **/
//var name:String = "You" + "Hua"         // name is YouHua
//name += " Jiang"                        // name is YouHua Jiang
//
///** \()，将常量、变量添加到字符串 **/
//let say = "\(name) is good man"         // say is YouHua Jiang is good man
//
///** %@ 格式化字符串 **/
//String(format: "String is %@", "abc")   // s1 is String is abc
//
///** %d 格式化Int **/
//String(format: "Int is %d", 2)          // Int is 2
//String(format: "Int is %04d", 2)        // Int is 0002
//
///** %f、%g 格式化Double **/
//String(format: "Double is %f", 1.1)     // Double is 1.100000
//String(format: "Double is %0.2f", 1.1)  // Double is 1.10
//String(format: "Double is %g", 1.1)     // Double is 1.1
//
//
//var slogan = "A rolling stone gathers no moss."
//
///** 字符串长 **/
//var i = slogan.count                        // i is 32
//
///** 字符串比较 **/
//var b1 = slogan == "Jiang Youhua"           // b1 is false
//
///** 字符串是否为空 **/
//var b2 = slogan.isEmpty                     // b2 is false
//
///** 判断是否包含另一个字符串 **/
//var b3 = slogan.contains("stone")           // b3 is true
//
///** 分割 **/
//var words = slogan.split(separator: " ")    // words is ["A", "rolling", "stone", "gathers", "no", "moss."]
//
///** 合并 **/
//var s1 = words.joined(separator: "_")       // s1 is A_rolling_stone_gathers_no_moss
//
///** 获取指定字符 **/
//let char = slogan[slogan.index(slogan.startIndex, offsetBy: 8)]            // char is g
//
///** 取部分 **/
//let start = slogan.index(slogan.startIndex, offsetBy: 3)
//let end = slogan.index(slogan.startIndex, offsetBy: 12)
//let sub1 = slogan[start...end]                                             // sub1 is olling sto
//let sub2 = slogan.prefix(1)                                                // sub2 is a
//let sub3 = slogan.suffix(2)                                                // sub3 is s.
//
///** 查找位置 **/
//let r:Range = slogan.range(of: "no")!
//let location = slogan.distance(from: slogan.startIndex, to: r.lowerBound)  // location is 24
//
//
///** 改变大小写 **/
//let s2 = slogan.uppercased()                              // s2 is A ROLLING STONE GATHERS NO MOSS.
//let s3 = slogan.lowercased()                              // s3 is a rolling stone gathers no moss."
//let s4 = slogan.capitalized                               // s4 is a rolling stone gathers no moss."
//
///** 替换字符串中的字符 **/
//let s5 = slogan.replacingOccurrences(of: ".", with: "!")  // s5 is A rolling stone gathers no moss!"
//
///** Array **/
//    let names = ["Anna", "Alex", "Brian", "Jack"]
//    for name in names {
//        // TODO
//    }
//
//    /** Dictionary **/
//    let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
//    for (animalName, legCount) in numberOfLegs {
//        // TODO
//    }
//    for (_, legCount) in numberOfLegs {
//        // TODO
//    }
//    // 下横杠符号表示，放弃该值
//
//    /** Rang **/
//    for i in 1...5 {
//        // TODO
//    }
//    for _ in -5...0 {
//        // TODO
//    }
//    for i in 0..<10 {
//         // TODO
//    }
//    for i in stride(from: 0, through: 12, by: 4) {
//        print(i)
//    }
//    // Prints 0, 4, 8, 12
//
//    /** String **/
//    let s:String = "JiangYouhua"
//    for c in s {
//         print(c)
//    }
//    // Prints J, i, a, n, g, Y, o, u, h, u, a
//
///***
//    sorted(by:)方法是Swift基本库的方法，用来对集合类型的数据进行排序，如数组。
//    sorted(by:)的作用：对已知类型的数组进行排序。
//    sorted(by:)的参数：(String, String) -> Bool。
//    下面对字符串数组进行排序，以说明闭包的几种应用形式
//    ***/
//
//    /** 1. 使用函数 **/
//    func backward(_ s1: String, _ s2: String) -> Bool {
//        return s1 > s2
//    }
//    let a = names.sorted(by:backward)
//    print("1. ", a)
//    // Prints ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
//
//    /** 2. 使用闭包，闭包类型与参数类型相同 **/
//    let b = names.sorted(by:{(s1: String, s2: String) -> Bool in return s1 > s2})
//    print("2. ", b)
//    // Prints ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
//
//    /** 3. 使用闭包，可从上下文推断其参数与返回数据的类型，所以可优化为 **/
//    let c = names.sorted(by:{s1, s2 in return s1 > s2})
//    print("3. ", c)
//    // Prints ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
//
//    /** 4. 使用闭包，因闭包只含单条语句，则可省掉“return”，所以可优化为 **/
//    let d = names.sorted(by:{s1, s2 in s1 > s2})
//    print("4. ", d)
//    // Prints ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
//
//    /** 5. 使用闭包，Swift自动为闭包提供$0,$1,$2之类，表示传入的参数，所以可以优化为 **/
//    let e = names.sorted(by:{$0 > $1})
//    print("5. ", e)
//    // Prints ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
//
//    /** 6. 使用闭包，用这种更短的方式，是基于大于号在木Swift中的定义，        **/
//    /**    它的定义与sorted(by:)的参数类型相同，即比较两个字符串并返回布尔值  **/
//    let f = names.sorted(by: > )
//    print("6. ", f)
//    // Prints ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
//

//func myFunc(param1: Int, param2: Int = 2, param3: Int = 1) {
//    param3 + param2 + param1
//}
//myFunc(param1: 3)
//
//func myFunc2(params1: Int... , params2: String...) {
//    var sum = 0;
//    for count in params1 {
//        sum += count
//    }
//    for temp in params2 {
//        print(temp)
//    }
//}
//myFunc2(params1: 1,2,3,4, params2: "h","hh","jjj")

//var set1: Set<Int> = [1, 2, 3, 5]
//var setIndex = set1.index(after: set1.startIndex)
//set1.remove(at: setIndex)

//闭包
let myClosures = {(param: Int) -> Int in
    return param * param
}

myClosures(3)

var a:Dictionary<String,String> = ["a":"A","b":"B","c":"C"]
a.updateValue("d", forKey: "d")
a
enum Name{
    case first(String)
    case last(String)
}

var name = Name.first("Jiang")

switch name {
case .first(let s):
    print("Your first name is \(s)")
case .last(let s):
    print("Your last name is \(s)")
}
// Prints Your first name is Jiang


class City{
    var province:String
    var info:Dictionary<String, String>?
    init(province: String){
        self.province = province
        self.info = [:]
    }
    // 这里是使用下标语法
    subscript(city: String) -> String {
        get {
            return self.info?[city] ?? ""
        }
        set {
            self.info?[city] = newValue
        }
    }
}

let city = City(province:"HuBei")
city["Daye"] = "Daye is a top 100 city"
print(city.province)
// Prints HuBei
print(city["Daye"])
// Prints Daye is a top 100 city

/** 1. 定义一下协议 **/
protocol MyDelegate {
    func doSomething(str:String) -> ()
}

/** 2. 应用这个协议 **/
class Part {
    var delegate:MyDelegate?
    func show() {
        delegate?.doSomething(str: "Hello world!")
    }
}

/** 3. 实现这个协议 **/
class Layout: MyDelegate {
    let part:Part
    init(){
        self.part = Part()
        part.delegate = self;
        
    }
    func doSomething(str: String) {
        print("Layout: " + str)
    }
}

let layout = Layout()
layout.part.show()
// Prints Layout: Layout: Hello world!

/** 一个购物的示例 **/
enum ShopError: Error {                       // 定义购买错误
    case notLoggedError                       // 未登录错误
    case notMemberError                       // 不是会员错误
    case freeToUseError                       // 免费使用
    case insufficientAmountError(score:Int)   // 积分不足错误
}

struct User{                                  // 定义用户
    var uid:Int                               // 用户ID
    var role:Int                              // 权限值，权限值为0,则为普通用户，非会员
    var score:Int                             // 积分值
}

class Shopping{                               // 定义购买类
    let user:User
    var total:Int = 0
    init(user:User){
        self.user = user
    }
    
    // 处理购物单
    func handleOrder(commodity:Dictionary<String, Int>)->(code:Int, info:String){
        guard user.uid > 0 else {
            return (code:1, info:"Not Logged in")
        }
        guard user.role > 0 else {
            return (code:2, info:"Not a Member")
        }
        
        // 计算总价
        for (_, i) in commodity {
            self.total += i
        }
        
        guard  self.total > 0 else {
            return (code:3, info:"Free to Use")
        }
        guard user.score > total else {
            return (code:3, info:"Insufficient Amount")
        }
        // TODO
        return (code:0, info:"Purchase success")
    }
    
    // 提交购物单，处理服务器返回结果
    func submitoOrder(commodity:Dictionary<String, Int>)throws->Int{
        let result = self.handleOrder(commodity: commodity)
        switch result.code {
        case 1:
            throw ShopError.notLoggedError
        case 2:
            throw ShopError.notMemberError
        case 3 :
            throw ShopError.insufficientAmountError(score:user.score)
        default:
            return self.total
        }
    }
}

/** 处理方式一：错误向上层转移，即未处理 **/
func buy1() throws {
    let user = User(uid: 1997, role: 1, score: 0)
    let order = ["pen":12,"book":17]
    let shop = Shopping(user: user)
    try shop.submitoOrder(commodity: order)
}
// buy1()
// 无法调用，因为上一层也需要处理错误
// Playground execution terminated: An error was thrown and was not caught.

/** 处理方式二：使用do-catch语句处理 **/
func buy2(){
    let user = User(uid: 1997, role: 0, score: 0)
    let order = ["pen":12,"book":17]
    let shop = Shopping(user: user)
    do {
        try shop.submitoOrder(commodity: order)
    }catch ShopError.notLoggedError{
        print("You are not logged in, please login")
    }catch ShopError.notMemberError{
        print("You are not a member, please join the membership")
    }catch ShopError.insufficientAmountError(let score){
        print("Your score are not enough, the score is only 10 \(score)")
    }catch{
        print("Unexpected error: \(error).")
    }
}
buy2()
// 处理了所有错误
// Prints You are not a member, please join the membership

/** 处理方式三：将错误作为可选值处理， **/
func buy3(){
    let user = User(uid: 1997, role: 1, score: 200)
    let order = ["pen":12,"book":17]
    let shop = Shopping(user: user)
    if let result = try? shop.submitoOrder(commodity: order){
        print("Please pay \(result) yuan")
    }
}
buy3()
// 有错就返回nil
// Prints Please pay 29 yuan

/** 处理方式四：断言错误不会发生 **/
func buy4(){
    let user = User(uid: 1997, role: 1, score: 1000)
    let order = ["pen":12,"book":17, "toy":479]
    let shop = Shopping(user: user)
    let result = try! shop.submitoOrder(commodity: order)
    print("Please pay \(result) yuan")
}
buy4()

