//: Playground - noun: a place where people can play

import UIKit
//验证是否为二叉树 -- 根据二叉树的特性。
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
    
    func isValidBST(_ root: TreeNode?) -> Bool {
     
            var prev: TreeNode? = nil
            return validate(root, &prev)
    }

    func validate(_ node: TreeNode?,_ prev: inout TreeNode? ) -> Bool {
        print(node?.val,node?.left?.val,node?.right?.val,prev?.val,prev?.left?.val,prev?.right?.val)
        guard let tmpNode = node else { return true }
        if validate(tmpNode.left, &prev) == false { return false }
        if prev != nil && ((prev?.val)! >= tmpNode.val) { return false }
        prev = tmpNode
        return validate(tmpNode.right, &prev)
    }
    
    
    func maxValue(_ node: TreeNode) -> Int {
        var rootNode:TreeNode? = node
        while rootNode?.right != nil {
            rootNode  = rootNode?.right
        }
        return rootNode!.val
    }
    
    func minValue(_ node: TreeNode) -> Int {
        var rootNode: TreeNode? = node
        while rootNode?.left != nil {
            rootNode = rootNode?.left
        }
        return rootNode!.val
    }
    
    func isBST(_ node: TreeNode?) -> Bool {
        guard let root = node else { return true }
        //如果左子树最大值大于根节点，则返回false
        if root.left != nil && (maxValue(root.left!) >= root.val) { return false }
        //如果右子树最小值小于根节点，则返回false
        if root.right != nil && (minValue(root.right!) <= root.val) { return false }
        //递归判断
        if (isBST(root.left) == false) || (isBST(root.right) == false) { return false }
        
        return true
    }
    
    func test()   {
        let node = TreeNode(5)
        node.left = TreeNode(3)
        node.left?.left = TreeNode(4)
//        node.right = TreeNode(3)
        print("asdfasdfasf")
//        node.right?.left?.right = TreeNode(15)
//        node.right?.left?.right?.right = TreeNode(45)
        print(isValidBST(node))
        
    }
}

let tet = Solution()
tet.test()






