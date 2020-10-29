// 迭代方法
// 空间可以优化
// TODO: 更自然的方法 - 模拟倒酒，向下更新，不用判断边界！
class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        let rows = query_row + 1
        let maxGlass = rows + 1
        var dp = Array(repeating: Array(repeating: -1.0, count: maxGlass), 
                       count: rows)
        dp[0][0] = Double(poured)
        
        for r in 1..<rows {
            for g in 0..<(r + 1) {
                let left = g > 0 ? dp[r - 1][g - 1] : 0
                let right = g < r ? dp[r - 1][g] : 0
                let fromLeft = max(0, (left - 1.0)/2)
                let fromRight = max(0, (right - 1.0)/2)
                dp[r][g] = fromLeft + fromRight
            }
        }
        return min(dp[query_row][query_glass], 1.0)
    }
}


// 递归方法太慢了
class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        // 一个杯子获得的量取决于它左上和右上获得的量，以此类推
        // 最简单的方法是使用递归
        // 每层的杯子数 = index + 1
        var dp = Array(repeating: Array(repeating: -1.0, count: query_row + 2), 
                       count: query_row + 1)
        dp[0][0] = Double(poured)
        
        func recur(_ query_row: Int, _ query_glass: Int) -> Double {
            guard query_row >= 0, query_glass >= 0, query_glass <= query_row + 1 else {
                return 0
            }
            
            if dp[query_row][query_glass] > 0 {
                return dp[query_row][query_glass]
            }

            let left = recur(query_row - 1, query_glass - 1)
            let right = recur(query_row - 1, query_glass)
            let fromLeft = max(0, (left - 1.0)/2)
            let fromRight = max(0, (right - 1.0)/2)
            let result = fromLeft + fromRight
            dp[query_row][query_glass] = result
            return result
        }
        
        return min(recur(query_row, query_glass), 1.0)
    }
}