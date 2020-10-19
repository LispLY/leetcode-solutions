// dp

class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        guard !prices.isEmpty, k > 0 else { return 0 }
        
        if 2 * k >= prices.count {
            var res = 0
            for p in 1..<prices.count {
                res += max(0, prices[p] - prices[p-1])
            }
            return res
        }
        
        // dp 方法：缓存每一天 0-k次交易 持有0-1支股票的最佳结果
        let day = [-1000, -1000]
        var origin = Array(repeating: day, count: k+1)
        var last = origin
        var cur = origin
        
        // 第一天的值
        last[0][0] = 0 // 未持有
        last[1][1] = -prices[0]
        
        // 迭代
        for d in 1..<prices.count {
            for i in 0...k {
                cur[i][0] = max(last[i][0], last[i][1] + prices[d])
                cur[i][1] = i>0 ? max(last[i][1], last[i-1][0] - prices[d]) : last[i][1]
            }
            last = cur
            cur = origin
        }
        return last.map { $0[0] } .max()!
    }
}