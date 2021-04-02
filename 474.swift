class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        // 深度优先搜索不行，太大了
        let nums = strs.map { $0.reduce((0, 0)) { $1 == "0" ? ($0.0 + 1, $0.1) : ($0.0, $0.1 + 1) }}
        
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        for (zeros, ones) in nums {
            for mm in stride(from: m, through: zeros, by: -1) {
                for nn in stride(from: n, through: ones, by: -1) {
                    dp[mm][nn] = max(dp[mm][nn], dp[mm - zeros][nn - ones] + 1)
                }
            }
        }
        
        return dp[m][n]
    }
}