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

class BSTIterator {
    private var nodes = [TreeNode]()

    private func pushLeftChildren(_ node: TreeNode?) {
        var node = node
        while node != nil {
            nodes.append(node!)
            node = node?.left
        }
    }
    
    init(_ root: TreeNode?) {
        guard let root = root else { return }
        pushLeftChildren(root)
    }
    
    func next() -> Int {
        let result = nodes.removeLast()
        if let right = result.right {
            pushLeftChildren(right)
        }
        return result.val
    }
    
    func hasNext() -> Bool {
        return !nodes.isEmpty
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */