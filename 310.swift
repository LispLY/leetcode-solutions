class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        // 迭代：减掉全部的叶子
        // 直到剩下1个或2个节点
        
        // 算法在 edges 为空的情况下失效
        guard !edges.isEmpty else { return [0] }
        
        var vertices = Array(repeating:Set<Int>(), count:n) // 顶点：相邻顶点们
        for e in edges {
            vertices[e[0]].insert(e[1])
            vertices[e[1]].insert(e[0])
        }
        
        var leafs = vertices.enumerated().filter { $0.1.count == 1 }.map { $0.0 }
        var n = n
        while n > 2 {
            var newLeafs = [Int]()
            for leaf in leafs {
                let parent = vertices[leaf].first!
                vertices[parent].remove(leaf)
                if vertices[parent].count == 1 {
                    newLeafs.append(parent)
                }
            }
            n -= leafs.count
            leafs = newLeafs
        }
        return leafs
    }
}