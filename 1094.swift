// passed

// TODO: 优化
// 当前思路：计算每个点的实际人数
// 优化思路：只需要在每个改变的节点记录增减人数

class Solution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        // 最简单的思路：计算在每一个节点的人数，判断有没有超过的。这样没办法扩展到浮点数的情况
        var demand = Array(repeating: 0, count: 1001)
        for t in trips {
            for i in t[1]..<t[2] {
                demand[i] += t[0]
            }
        }
        return demand.filter { $0 > capacity }.isEmpty
    }
}