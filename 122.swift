// 更本质的思路：每两天之间的差只要是正的，就能赚到！
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var result = 0
        for i in prices.indices.dropFirst() {
            result += max(0, prices[i] - prices[i-1])
        }
        return result
    }
}

// 普通思路 模拟
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // 和第一题思路不同
        // 0. 没有右边 && 手中有：卖出
        // 1. 右边比我小 && 手中有：卖出
        // 2. 右边比我大 && 手中无：买入
        // 其余：不动
        var have = false 
        var cost = 0
        var result = 0
        
        for i in 0..<(prices.count - 1) { // 最后一次单独考虑
            if have, prices[i+1] < prices[i] { // 1
                have.toggle()
                result += prices[i] - cost
            } else if !have, prices[i+1] > prices[i] { // 2
                have.toggle()
                cost = prices[i]
            }
        }
        if have { // 0
            result += prices.last! - cost
        }
        return result
    }
}