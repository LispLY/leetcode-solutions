// passed

class Solution {
    func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        // 以左端点为key做dict ❌, 因为不确保有正好合适的

        // 按左端点排序，保留原来的index
        var lookup: [(interval: [Int], index: Int)] = []
        for (i, interval) in intervals.enumerated() {
            lookup.append((interval, i))
        }
        lookup.sort { $0.interval[0] < $1.interval[0] }

        func searchMin(_ i: Int) -> Int {
            var left = 0
            var right = lookup.count - 1
            while left < right {
                let mid = (left + right) / 2
                // print(left, right, mid)
                let target = lookup[mid]
                
                if target.interval[0] == i {
                    return target.index
                } else if target.interval[0] < i {
                    left = mid + 1
                } else { // target > i
                    if mid > 1, lookup[mid-1].interval[0] < i {
                        return target.index
                    }
                    right = mid
                }
            } 
            let res = lookup[right]
            return res.interval[0] >= i ? res.index : -1
        }
        
        // 对输入的每个区间，在lookup中做binary search，找到合适的区间
        let result = intervals.map { searchMin($0[1]) }

        return result
    }
}