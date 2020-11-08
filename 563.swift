// 更简单的一趟的方法：树的值保存sum，单独用一个累加变量保存tilt，因为在计算中不会用到每个tilt的值，只有在最终结果中才需要

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
    func findTilt(_ root: TreeNode?) -> Int {
        // 返回值传sum，树的值保存tilt，在修改树的值前先把返回值算出来
        func trav(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            // print("trav: \(root.val)")
            let lsum = trav(root.left)
            let rsum = trav(root.right)
            let result = lsum + rsum + root.val
            root.val = abs(lsum - rsum)
            return result
        }
        
        func sum(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            // print("sum: \(root.val)")
            return sum(root.left) + sum(root.right) + root.val
        }
        
        trav(root)
        return sum(root)
    }
}