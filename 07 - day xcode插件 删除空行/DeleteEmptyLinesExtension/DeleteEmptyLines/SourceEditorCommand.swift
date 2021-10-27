//
//  SourceEditorCommand.swift
//  DeleteEmptyLines
//
//  Created by Anlesu on 2021/1/21.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
//      defer语句在代码块作用域退出之前执行
//      一个代码块中允许多个defer 执行顺序从后往前
        defer {
            
            completionHandler(nil)
        }
        
        invocation.deleteEmptyLines()
    }
    
}


extension XCSourceEditorCommandInvocation {
    //extension为类添加嵌套类型
    var selections: [XCSourceTextRange] {
        //as!将NSObject转成一个具体的类型(注意:如果转化不成功,程序会崩溃)
        return buffer.selections as! [XCSourceTextRange]
    }
    //extension为类添加实例方法
    func deleteEmptyLines() {
        selections.forEach { (selection) in
            let start = selection.startLine
            let end = selection.endLine
            let emptyIndex = (start...end).filter({ (index) -> Bool in
                (buffer.lines[index] as! String).match(regular:"^\\s*$")
            })
            
            buffer.lines.removeObjects(at: IndexSet(emptyIndex))
            
        }
    }
}

extension String {
    func match(regular: String) -> Bool {
        /**
         *swift中还提供了另一种好用的正则方式，就是String的range函数，它可以传入正则和一些其他参数来验证该字符串是否符合正则
         */
        return range(of: regular, options: .regularExpression) != nil
    }
}

extension XCSourceTextRange {
    var startLine: Int {
        return start.line
    }
    
    var endLine: Int {
        return end.line - (end.column == 0 ? 1 : 0)
    }
    
}
