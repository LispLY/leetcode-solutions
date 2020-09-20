// passed

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var buy = 0
        var profit = 0
        for i in prices.indices {
            if prices[i] < prices[buy] {
                buy = i
            } else {
                profit = max(profit, prices[i] - prices[buy])
            }
        }
        return profit
    }
}