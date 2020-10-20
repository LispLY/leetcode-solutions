/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        // 复制节点，不要指向原来的点，避免重复
        // 用一个列表，全搜索完再连接
        // 表中没有，加入表，递归搜索；表中有，忽略
        var allNodes = [Node?](repeating: nil, count: 101)
        
        func recur(_ node: Node?) {
            guard let node = node, allNodes[node.val] == nil else { return }
            
            allNodes[node.val] = node
            for n in node.neighbors {
                recur(n)
            }
        }
        
        recur(node)
        
        // only val copied
        let copied = allNodes.map { n in
            n == nil ? nil : Node(n!.val)
        }
        
        for i in allNodes.indices where allNodes[i] != nil {
            for nei in allNodes[i]!.neighbors {
                copied[i]!.neighbors.append(copied[nei!.val])
            }
        }
        
        return copied[1]
    }
}