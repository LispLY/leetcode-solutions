// passed


class Solution1 {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        if timeSeries.isEmpty { 
            return 0 
        }
        
        var total = duration
        for i in 1..<timeSeries.count {
            total += min(duration, timeSeries[i] - timeSeries[i-1])
        }
        return total
    }
}

class Solution2 {
    // 这个有点overkill，因为每次duration是相等的
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        // 维持一个last状态
        //   每个新的输入
        //   end < last: add = 0
        //   start < last: add = end - last
        //   更新 last
        var last = 0
        var total = 0
        for start in timeSeries {
            let end = start + duration
            if last <= start {
                total += duration
            } else {
                total += max(end - last, 0)
            }
            last = max(end, last)
        }
        return total
    }
}
