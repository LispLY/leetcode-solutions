// passed

class Solution {
    func bitwiseComplement(_ N: Int) -> Int {
        // 找到大于 N 的最小的 2^n, return 2^n - 1 - N
        var pow = 2
        while pow <= N {
            pow *= 2
        }
        return pow - 1 - N
    }
}