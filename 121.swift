class Solution {
    // 关键：找到各个极小值，每个极小值向右线性扫描就行
    func maxProfit(_ prices: [Int]) -> Int {
        var l = 0
        var maxProfit = 0
        for r in prices.indices {
            if prices[r] < prices[l] {
                l = r
            } else {
                maxProfit = max(maxProfit, prices[r] - prices[l])
            }
        }
        return maxProfit
    }
}