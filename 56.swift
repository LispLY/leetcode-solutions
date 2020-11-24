class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // 排序后依序处理，按左边界排序
        let intervals = intervals.sorted { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] }
        var result = [intervals.first!]
        for interv in intervals.dropFirst() {
            // 全包含，全不包含，相交
            let lastIndex = result.count - 1
            if interv[1] <= result[lastIndex][1] {
                continue
            } else if interv[0] > result[lastIndex][1] {
                result.append(interv)
            } else {
                result[lastIndex][1] = interv[1]
            }
        }
        return result
    }
}