//
//  main.swift
//  遍历二叉树
//
//  Created by Anlesu on 2021/11/22.
//

import Foundation

print("Hello, World!")
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func preorderTraversal(_ node: TreeNode?) -> [Int] {
        var res:[Int] = []
        guard let node = node else { return [] }
        res.append(node.val)
        res += preorderTraversal(node.left)
        res += preorderTraversal(node.right)
        return res
    }
}

