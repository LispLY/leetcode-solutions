/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        // 已经设置好的next指针会帮助后续的遍历
        // 换句话说，后续的遍历可以利用已经设置好的next指针
        
        // 对于每棵树，如果已经有next
        // my.left.next = my.right; my.right.next = my.next.left
        guard let left = root?.left, let right = root?.right else {
            return root
        }
        left.next = right
        if let next = root?.next {
            right.next = next.left
        }
        connect(left)
        connect(right)
        return root
    }
}

class Solution1 {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var queue = [root]
        while !queue.isEmpty {
            let count = queue.count
            for i in 0..<count {
                let node = queue.removeFirst()
                if i < count - 1 {
                    node.next = queue.first
                }
                if node.left != nil {
                    queue.append(node.left!)
                    queue.append(node.right!)
                }
            }
        }
        return root
    }
}