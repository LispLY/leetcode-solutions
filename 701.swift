// passed

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        // 搜搜 val 的值，插入到第一个遇到 nil 的位置
        guard let node = root else {
            return TreeNode(val)
        }
        if val < node.val {
            node.left = insertIntoBST(node.left, val)
            return node
        } else if val > node.val {
            node.right = insertIntoBST(node.right, val)
            return node
        }
        fatalError("val already in the tree")
    }
}