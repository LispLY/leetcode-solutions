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

 // 速度比较慢
class Solution {
    // 叶子的可能性 1种
    // 子树的可能性：（左儿子的所有可能，右儿子的所有可能），自己，自己+左儿子(所有可能)，自己+右儿子(所有可能)，前两个已经被包含。
    // 深度优先遍历，保存所有可能的值
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        
        var allvals = [Int]()
        
        func handle(_ node: TreeNode) -> ([Int]) {
            var v = [node.val]
            if let left = node.left {
                v += (handle(left).map { $0 + node.val })
            }
            if let right = node.right {
                v += (handle(right).map { $0 + node.val })
            }
            allvals += v
            return v
        }
        
        handle(root)
        let res = allvals.filter { $0 == sum }.count
        return res
    }
}