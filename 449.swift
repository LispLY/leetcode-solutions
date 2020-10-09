// passed

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        // 先序遍历
        var nums = [Int]()

        func add(_ node: TreeNode?) {
            guard let node = node else { return }
            nums.append(node.val)
            add(node.left)
            add(node.right)
        }

        add(root)
        return nums.map { String($0) }.joined(separator: " ")
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        // 是否有更快的方法？
        let nums = data.split(separator: " ").map { Int($0)! }
        guard !nums.isEmpty else { 
            return nil
        }
        let tree = TreeNode(nums[0])

        func add(_ num: Int, _ target: TreeNode?) -> TreeNode? {
            guard let target = target else {
                return TreeNode(num)
            }
            if num < target.val {
                target.left = add(num, target.left)
            } else if num > target.val {
                target.right = add(num, target.right)
            }
            return target
        }

        for num in nums[1...] {
            add(num, tree)
        }
        return tree
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let ser = Codec()
 * let deser = Codec()
 * let tree: String = ser.serialize(root)
 * let ans = deser.deserialize(tree)
 * return ans
*/