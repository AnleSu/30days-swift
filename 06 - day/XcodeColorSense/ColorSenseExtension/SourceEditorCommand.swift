//
//  SourceEditorCommand.swift
//  ColorSenseExtension
//
//  Created by Anlesu on 2021/1/12.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        guard let selection = invocation.buffer.selections.firstObject as? XCSourceTextRange else {
            completionHandler(nil)
            return
        }
        
        let lineNumber = selection.start.line
        
        guard lineNumber < invocation.buffer.lines.count,      let line = invocation.buffer.lines[lineNumber] as? String else {
            completionHandler(nil)
            return
            
        }
        
        guard let hex = findHex(string: line) else {
            completionHandler(nil)
            return
            
        }

        let newLine = process(line: line, hex: hex)
        invocation.buffer.lines.replaceObject(at: lineNumber, with: newLine)
        
        completionHandler(nil)
    }
    
    func findHex(string: String) -> String? {
        let pattern = "\"#?[A-Fa-f0-9]{6}\""
        guard let range = check(string: string, pattern: pattern)  else {
            return nil
        }
        return (string as NSString).substring(with: range)
        
    }
    
    func check(string: String, pattern: String) -> NSRange? {
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        return regex?.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count))?.range
        
    }
    
    func findMarkAndRemove(string: String) -> String? {
        let pattern = "\\/\\/ color: .*"
        guard let range = self.check(string: string, pattern: pattern) else {
            return nil
        }
        return (string as NSString).substring(with: range)
        
    }
    
    func process(line: String, hex: String) -> String {
        let line = line.replacingOccurrences(of: "\n", with: "")
        let hex = hex.replacingOccurrences(of: "\"", with: "")
        
        guard let name = Parser().parse(hex: hex) else {
            return line
        }
        
        if let removedMard = findMarkAndRemove(string: line) {
            return removedMard
        }
        
        // Add mark 这里只适用于Swift代码
        let rgb = Converter().rgb(hex: hex)
        let literal = "#colorLiteral(red: \(rgb.r/255), green: \(rgb.g/255), blue: \(rgb.b/255), alpha: 1.0)"
        return line.appending(" // color: \(name)").appending(" \(literal)")
        
        
    }

    
}
