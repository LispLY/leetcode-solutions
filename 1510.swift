// dp，只要存在一种选择能够导致对方必负，就是必胜的状态
class Solution {
    var dp = [0: false, 1: true]
    
    func winnerSquareGame(_ n: Int) -> Bool {
        if let cache = dp[n] {
            return cache
        }
        var s = 1
        while s * s <= n {
            if !winnerSquareGame(n - s * s) {
                dp[n] = true
                return true
            }
            s += 1
        }
        dp[n] = false
        return false
    }
}