// passed
// 线性时间

class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        // 关键：从右向左走，比当前值更小的值都可以扔掉
        var stack = [Int]()
        var result = Array(repeating: 0, count: T.count)
        for i in (0..<T.count).reversed() {
            while !stack.isEmpty, T[i] >= T[stack.last!] {
                stack.removeLast()
            }
            result[i] = stack.isEmpty ? 0 : stack.last! - i
            stack.append(i)
        }
        return result
    }
}


class Solution0 {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        // 傻瓜方法 太慢 最坏情况 O(n2)
        var result = Array(repeating: 0, count: T.count)
        for (i, cur) in T.enumerated() {
            for j in i+1..<T.count {
                if T[j] > cur {
                    result[i] = j - i
                    break
                }
            }
        }
        return result
    }
}

class Solution1 {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        // 每走一步更新所有左边的结果 好像比傻瓜方法更慢 最坏情况 O(n2)
        var result = Array(repeating: 0, count: T.count)
        for (i, cur) in T.enumerated() {
            for j in 0..<i {
                if result[j] > 0 { continue }
                
                if cur > T[j] {
                    result[j] = i - j
                }
            }
        }
        return result
    }
}

class Solution2 {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        // 简单的动态规划，从右往左走，缓存右边最大值，还是很慢
        var maxRight = Array(repeating: 0, count: T.count+1)
        var result = Array(repeating: 0, count: T.count)
        for i in (0..<T.count).reversed() {
            maxRight[i] = max(T[i], maxRight[i+1])
            if maxRight[i] <= T[i] {
                continue
            }
            for j in i+1..<T.count {
                if T[j] > T[i] {
                    result[i] = j - i
                    break
                }
            }
        }
        return result
    }
}
