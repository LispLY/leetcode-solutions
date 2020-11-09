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
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        // helper 返回最大和最小的子孙(包括自己)，同时更新当前的result
        var result = 0
        
        func helper(_ root: TreeNode?) -> (Int, Int)? {
            guard let root = root else { return nil }
            let (minl, maxl) = helper(root.left) ?? (root.val, root.val)
            let (minr, maxr) = helper(root.right) ?? (root.val, root.val)
            let thismin = min(minl, minr)
            let thismax = max(maxl, maxr)
            let retmin = min(thismin, root.val)
            let retmax = max(thismax, root.val)
            let thisResult = max(abs(root.val - thismin), abs(root.val - thismax))
            result = max(result, thisResult)
            return (retmin, retmax)
        }
        
        // 遍历一遍出结果
        helper(root)
        return result
    }
}