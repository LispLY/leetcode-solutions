// 思路：基于第一题
// 要点：第一题作为一个 online 方法，能给出截止到每一步的答案
// 从前到后，找到截止到每个点的最好结果，O(n)
// 从后到前，找到截止到每个点的最好结果
// 两者和的最大值就是结果

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // 由左至右
        var lresults = Array(repeating: 0, count: prices.count)
        var l = 0
        for r in prices.indices.dropFirst() {
            lresults[r] = max(lresults[r-1], prices[r] - prices[l])
            if prices[r] < prices[l] {
                l = r
            }
        }

        // 由右至左
        var rresult = 0
        var best = 0
        var r = prices.count - 1
        for l in prices.indices.reversed().dropFirst() {
            rresult = max(rresult, prices[r] - prices[l])
            if prices[r] < prices[l] {
                r = l
            }
            best = max(best, lresults[l] + rresult)
        }
        return best
    }
}

// from others

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        
        var maxProfitLeft = [Int]() // 从左端点开始，截止到每个点的最高
        var maxProfit = 0
        
        var low = prices.first!
        for price in prices {
            low = min(price, low) // update 至今为止的最低点
            maxProfit = max(price - low, maxProfit) // update 至今为止的最高差额
            maxProfitLeft.append(maxProfit) 
        }
        
        
        var high = prices.last!
        var finalMaxProfit = 0
        maxProfit = 0 // 重用变量！！
        for i in stride(from: prices.count-1, through: 0, by: -1) {
            let price = prices[i] 
            high = max(price, high) // update 至今为止的最高点
            maxProfit = max(high - price, maxProfit) // update 至今为止的最高差额
            finalMaxProfit = max(finalMaxProfit, maxProfit + maxProfitLeft[i]) // update result
        }
        
        return finalMaxProfit
    }
}
