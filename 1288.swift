// passed

// O(n^2), not the best solution
class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        var result = Array(repeating: true, count: intervals.count)
        for i in intervals.indices where result[i] {
            for j in i+1..<intervals.count where result[j] {
                if intervals[i][0] >= intervals[j][0], 
                   intervals[i][1] <= intervals[j][1] {
                    result[i] = false
                    break
                } else if intervals[i][0] <= intervals[j][0], 
                          intervals[i][1] >= intervals[j][1] {
                    result[j] = false
                }
            }
        }
        return result.reduce(0) { $1 ? $0 + 1 : $0 }
    }
}

// from others O(n*log n)

class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        
        var intervals = intervals
        intervals.sort(by: { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] })
        // smart way to sort !
        
        var total = 0
        var right = 0
        
        for a in intervals{
            if a[1] > right {
                right = a[1]
                total += 1
            }
        }
        return total
        
    }
}
