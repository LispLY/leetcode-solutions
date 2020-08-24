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
    func recur(_ node: TreeNode?) -> (Int, Bool) { // Bool: isLeaf
        guard let node = node else { return (0, true) }
        
        let (rightResult, rIsLeaf) = recur(node.right)
        let rightSum = rIsLeaf ? 0 : rightSum
        let (leftSum, _) = recur(node.left)
        
        let isLeaf = node.left == nil && node.right == nil
        let result =  isLeaf ? node.val : leftSum + rightSum
        return (result, isLeaf)
    }
    
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if root?.left == nil && root?.right == nil { //onlyOneNode
            return 0
        }
        return recur(root).0
    }
}

// 另一个思路，父亲在调用孩子时告诉他 他是左节点还是右节点，这样就能自然地兼容只有一层的情况
