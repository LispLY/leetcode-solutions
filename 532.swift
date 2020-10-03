// passed

class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        // 遍历每个数时：
        // 1. 看这个数满足了哪些前面的期待
        // 2. 记录这个数期待哪两个数
        var expect = [Int: [Int]]() // number : from whom
        var result = [Int: Set<Int>]() // smaller : bigger
        for n in nums {
            // consume
            for origin in expect[n, default: [Int]()] {
                let (smaller, bigger) = (min(n, origin), max(n, origin))
                result[smaller, default: Set<Int>()].insert(bigger)
            }
            // pruduct
            expect[n+k, default: [Int]()].append(n)
            if k != 0 {
                expect[n-k, default: [Int]()].append(n)
            }
        }
        return result.values.reduce(0) { $0 + $1.count }
    }
}