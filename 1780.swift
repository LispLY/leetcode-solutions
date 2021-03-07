class Solution {
    func maxPower(_ n: Int) -> Int {
        var power = 1
        while power * 3 <= n {
            power *= 3
        }
        return power
    }
    
    func checkPowersOfThree(_ n: Int) -> Bool {
        // 贪心法
        var n = n
        var p = maxPower(n)
        while p > 0 {
            if n >= p {
                n -= p
                if n == 0 {
                    return true
                }
            }
            p /= 3
        }
        return false
    }
}