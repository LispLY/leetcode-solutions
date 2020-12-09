class Solution1 {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        // online 方法
        var result = 0
        var brackets = Array(repeating: 0, count: 60)
        for t in time {
            let mod = t % 60
            if mod == 0 {
                result += brackets[0]
            } else {
                result += brackets[60 - mod]
            }
            brackets[mod] += 1
        }
        return result
    }
}

class Solution2 {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var brackets = Array(repeating: 0, count: 60)
        for t in time {
            brackets[t % 60] += 1
        }
        
        var result = 0
        for i in 1...29 {
            result += brackets[i] * brackets[60 - i]
        }
        
        result += (brackets[0]) * (brackets[0] - 1) / 2
        result += (brackets[30]) * (brackets[30] - 1) / 2
        return result
    }
}