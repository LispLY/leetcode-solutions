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
    // 先序遍历，利用已经设置好的next指针
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }

        // 进入函数的时候，如果root有next，应该已经是设置好的了
        // 设置自己内部
        root.left?.next = root.right
        
        // 最后一个next指向相邻树
        guard let this = root.right ?? root.left else { // 没有儿子的话就没必要继续
            return root
        }
        var next = root.next
        while next != nil {
            if let target = next!.left ?? next!.right {
                this.next = target
                break
            }
            next = next!.next
        }
        
        // !!! 先右后左，否则的话，next链有可能还没准备好
        connect(root.right)
        connect(root.left)
        return root
    }
}