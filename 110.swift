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
    func isBalanced(_ root: TreeNode?) -> Bool {
        let result = check(root)
        return result.balanced
    }
    
    func check(_ root: TreeNode?) -> (height: Int, balanced: Bool) {
        guard let root = root else { return (0, true) }
        let (lh, lb) = check(root.left)
        let (rh, rb) = check(root.right)
        if !lb || !rb || lh - rh > 1 || lh - rh < -1 {
            return (0, false)
        }
        return (max(lh, rh) + 1, true)
    }   
}