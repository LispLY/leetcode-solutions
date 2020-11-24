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
    func rob(_ root: TreeNode?) -> Int {
        // 在一棵树上能得到的最大钱数 = max（树根+左右子树的子树，左右子树）
        let (result, _, _) = maxVal(root)
        return result
    }
    
    func maxVal(_ root: TreeNode?) -> (Int, Int, Int) { // self left right 
        guard let root = root else {
            return (0, 0, 0)
        }
        let (left, ll, lr) = maxVal(root.left)
        let (right, rl, rr) = maxVal(root.right)
        let res = max(root.val + ll + lr + rl + rr, left + right)
        return (res, left, right)
    }
}