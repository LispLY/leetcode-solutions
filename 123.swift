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
