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
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        // 向下传递时带上现有值，向上传递时汇总
        func recurv(_ node: TreeNode?, _ cur: Int) -> Int {
            guard let node = node else { return 0 }
            let cur = node.val + cur * 2
            let l = recurv(node.left, cur)
            let r = recurv(node.right, cur)
            // 有儿子，返回儿子的和，没儿子，返回自己
            if l + r == 0 {
                return cur
            } else {
                return l + r
            }
        }
        return recurv(root, 0)
    }
}