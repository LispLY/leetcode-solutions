// passed

class Solution {
    // DP
    // 要点:
    // 1. 每一天都有一个dp，如果当天没行程，dp的值等于上一天
    // 2. 用Set装days，便于查找
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        // -1 表示空
        var memo = Array(repeating: -1, count: 366)
        let days = Set(days)
        
        func dp(_ day: Int) -> Int {
            guard day > 0 else {
                return 0
            }
            
            if memo[day] >= 0 {
                return memo[day]
            }
            
            if days.contains(day) {
                let res = min(dp(day - 30) + costs[2],
                              dp(day - 7) + costs[1],
                              dp(day - 1) + costs[0])
                memo[day] = res
                return res
            } else {
                return dp(day - 1)
            }
        }
        
        return dp(365)
    }
}

class Solution1 {
    // 深度优先搜索 + 剪枝，速度很慢
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        // 深度优先搜索 + trim ？
        // 递归，从大的开始
        // 缓存一个 best by now
        
        let daysToAdd = [1, 7, 30]
        var bestByDay: [Int] = Array(repeating: Int.max, count: days.count)
        
        func recur(_ nextDayIndex: Int, _ costByNow: Int) {
            if nextDayIndex > days.count - 1 {
                
                bestByDay[bestByDay.count-1] = min(bestByDay.last!, costByNow)
                
            } else {
                
                if nextDayIndex > 1 {
                    //
                    if costByNow >= bestByDay[nextDayIndex - 1] {
                        return
                    } else {
                        for i in 1...nextDayIndex {
                            bestByDay[i - 1] = min(bestByDay[i - 1], costByNow)
                        }
                    }
                }
                
                for i in [2, 1, 0] {
                    let nextCost = costByNow + costs[i]
                    let nextDayIndex = days[nextDayIndex...].firstIndex {
                        $0 >= days[nextDayIndex] + daysToAdd[i]
                        } ?? 366
                    recur(nextDayIndex, nextCost)
                }
            }
        }
        
        recur(0, 0)
        return bestByDay.last!
    }
}


/// test

//let d =  [1,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,21,24,25,27,28,29,30,31,34,37,38,39,41,43,44,45,47,48,49,54,57,60,62,63,66,69,70,72,74,76,78,80,81,82,83,84,85,88,89,91,93,94,97,99]
//let c = [9,38,134]

//let d = [1,4,6,7,8,20]
//let c = [2,7,15]


let d = [1, 4,  6,  9,  10,11,12,13,14,15,16,  17,18,20,21,22,23,  27,  28]
let c = [3,13,45]

Solution().mincostTickets(d, c)
