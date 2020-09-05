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
    // Inorder Traversal
    func toArray(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [Int]() }
        let l = toArray(root.left)
        let r = toArray(root.right)
        return l + [root.val] + r
    }
    
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        let a1 = toArray(root1)
        let a2 = toArray(root2)
        var i = 0
        var j = 0
        var result = [Int]()
        while i < a1.count, j < a2.count {
            if a1[i] < a2[j] {
                result.append(a1[i])
                i += 1
            } else {
                result.append(a2[j])
                j += 1
            }
        }
        result.append(contentsOf: a1[i...])
        result.append(contentsOf: a2[j...])
        return result
    }
}