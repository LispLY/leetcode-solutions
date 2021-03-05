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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        // 层序遍历
        var res = [Double]()
        var level = [root!]
        while !level.isEmpty {
            let count = level.count
            res.append(level.reduce(0.0) { $0 + Double($1.val) } / Double(count))
            
            for _ in 0..<count {
                let first = level.removeFirst()
                if let l = first.left {
                    level.append(l)
                }
                if let r = first.right {
                    level.append(r)
                }
            }
        }
        return res
    }
}