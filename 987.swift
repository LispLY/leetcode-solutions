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
    // 遍历一个树，给每个节点编号，把每个节点扔到号码对应的容器中
    // 容器：[Int: [Int]]
    
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [[Int]]() }
        
        var result = [(x: Int, y: Int, value: Int)]()
        
        func solveNode(_ node: TreeNode, _ x: Int, _ y: Int) { // 把node和它的子孙编号，扔到result中
            result.append((x, y, node.val))
            if let left = node.left {
                solveNode(left, x-1, y-1)
            }
            if let right = node.right {
                solveNode(right, x+1, y-1)
            }
        }
        
        solveNode(root!, 0, 0)
        
        result = result.sorted {
            if $0.x == $1.x {
                if $0.y == $1.y {
                    return $0.value < $1.value
                }
                return $0.y > $1.y
            }
            return $0.x < $1.x
        } 
        
        var finalResult = [[Int]]()
        for (i, data) in result.enumerated() {
            if i == 0 {
                finalResult.append([data.value])
            } else {
                let last = result[i-1]
                // print("//")
                // print(data)
                // print(last)
                if data.x == last.x {
                    finalResult[finalResult.count-1].append(data.value)
                } else {
                    finalResult.append([data.value])
                }
            }
        }
        return finalResult
    }
}
