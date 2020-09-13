// passed

class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        func recurv(_ k: Int, _ n: Int, _ range: ClosedRange<Int>) -> [[Int]] {
            if k == 1 {
                return range.contains(n) ? [[n]] : [[Int]]() // [[n]]
            } else {
                let heads = range.filter {
                    $0 <= n / 2 && $0 + 1 <= range.upperBound
                }
                return heads.flatMap { head in
                    recurv(k-1, n-head, (head+1)...range.upperBound).filter {
                        !$0.isEmpty
                    }.map {
                        [head] + $0
                    }
                }
            }
        }
        return recurv(k, n, 1...9)
    }
}
