
// DFS from others
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var result = Int.max
        let sorted = coins.sorted(by: <)
        func dfs(_ i: Int, _ a: Int, _ count: Int) {
            if i < 0 { return }
            var times = a / sorted[i]            
            while times >= 0 {
                let amountLeft = a - times * sorted[i]
                let newCount = times + count
                if amountLeft == 0 {
                    result = min(result, newCount)
                    break
                }
                if newCount + 1 >= result {
                    break
                }
                dfs(i - 1, amountLeft, newCount)
                times -= 1
            }
        }
        dfs(sorted.count - 1, amount, 0)
        return result == Int.max ? -1 : result
    }
}

// recursive
class Solution {
    var dp: [Int: Int] = [0: 0] // [金额 : 硬币数]

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount >= 0 else {
            return -1
        }
        if let res = dp[amount] {
            return res
        }
        
        var minRes = Int.max
        for c in coins {
            let res = coinChange(coins, amount - c)
            if res >= 0 {
                minRes = min(minRes, res + 1)
            }
        }
        let result = minRes == Int.max ? -1 : minRes
        dp[amount] = result
        return result
    }
}

// iterative
class Solution {
    var dp: [Int: Int] = [0: 0] // [金额 : 硬币数]

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {        
        if amount == 0 {
            return 0
        }

        for total in 1...amount {
            var minRes = Int.max
            for c in coins {
                if let res = dp[total - c], res >= 0 {
                    minRes = min(minRes, res + 1)
                }
            }
            dp[total] = minRes == Int.max ? -1 : minRes
        }

        return dp[amount]!
    }
}
