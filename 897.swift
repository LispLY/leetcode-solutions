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
    func helper(_ root: TreeNode) -> (head: TreeNode, tail: TreeNode) {
        var head = root
        var tail = root
        if let right = root.right {
            let result = helper(right)
            head.right = result.head
            tail = result.tail
        }
        if let left = root.left {
            let result = helper(left)
            result.tail.right = head
            head.left = nil
            head = result.head
        }
        return (head, tail)
    }
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        // 递归地想
        // 我是我调整后的左子树的叶子的右儿子
        // 我的右子树调整后是我的右儿子
        // 返回子树和tail
        // 优化可能：如果不能返回多个值的话可以让树根的左子树指向尾巴
        guard let root = root else { return nil }
        let (result, _) = helper(root)
        return result
    }
}