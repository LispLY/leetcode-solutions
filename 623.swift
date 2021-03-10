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

// 给二叉树插入一横行
// 递归方法：在 d-1 层级操作，因为下一层不知道自己是左还是右
// d = 2 时，返回新的树,插入新的节点
// 不管有没有子树，都要插入v
// d = 1 时，在顶层插，要单独讨论

class Solution {
    func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }    
        if d == 1 {
            return TreeNode(v, root, nil)
        } else if d == 2 {
            root.left = TreeNode(v, root.left, nil)
            root.right = TreeNode(v, nil, root.right)
            return root
        } else {
            root.left = addOneRow(root.left, v, d-1)
            root.right = addOneRow(root.right, v, d-1)
            return root
        }
    }
}