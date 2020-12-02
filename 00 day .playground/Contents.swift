import Cocoa

var str = "Hello, playground"
Int.min
Int.max


let millon = 1_000_000

var oneThirdinfloat: Float = 1/3

var oneThirdinDouble: Double = 1/3

var PI = 314e-2

type(of: PI)

//swift 对String 做出的调整优化
let cafe = "Caf\u{00e9}"

let cafee = "Caf\u{0065}\u{0301}"

cafe == cafee

cafe.utf8.count

cafe.utf16.count
//string  不作为集合类型 是因为难以符合 Unicode复杂的组合规则  难以保证安全和正确性
//extension String: Collection {
//
//}

var swift = "swift is fun"
swift.dropFirst(9)

let group = "👨‍👨‍👦‍👦"
//group.dropLast()

group.unicodeScalars.forEach {
    print($0)
}

let cafes = "cafe"
cafes.startIndex

var mixStr = "swift很有趣"
for (index ,value) in mixStr.enumerated() {
    print("\(index) \(value)")
}

if let index = mixStr.index(of: "很") {
    mixStr.insert(contentsOf: "4.0", at: index)
}

//tuple  打包不同类型的数据   最多只能比较包含6个元素的tuple
let success = (200, "http ok")
let filenotFound = (404, "file not found")

success.0
success.1

let me = (name: "mark", no:11, email:"11@163.com")
me.name

var (successCode, successMrssage) = success

successCode

let (_, message) = filenotFound
message

//操作符
//option
let user: String? = "user"
//闭区间
for index in 1...3 {
    print(index)
}


//Markdown




  

