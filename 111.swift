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
    func minDepth(_ root: TreeNode?) -> Int {
        // 层序遍历更快一点，先序遍历不需要额外的数据存储
        guard let root = root else { return 0 }
        var layer: [TreeNode] = [root]
        var d = 0
        while !layer.isEmpty {
            d += 1
            let c = layer.count
            for _ in 0..<c {
                let node = layer.removeFirst()
                if let left = node.left {
                    layer.append(left)
                } 
                if let right = node.right {
                    layer.append(right)
                }
                if node.left == nil, node.right == nil { 
                    return d
                }
            }
        }
        return d
    }
}