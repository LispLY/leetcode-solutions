class Solution {
    func numDecodings(_ s: String) -> Int {
        // 动态规划
        // n位的全部可能性 = n-1位加一位的全部可能性 + n-2位加两位的全部可能性 // 还要过滤掉不可能的情况
        // 1...26
        // 遇到错误的话返回0
        // 可能的错误：开头的0，前面没有1或2的0
        let digits = s.map { c in c.asciiValue! - Character("0").asciiValue! }
        
        var dp = [Int]() // dp[n]存储前n位的结果
        
        guard digits.count > 1 else { 
            return (digits.first ?? 0) > 0 ? 1 : 0
        }
        guard digits[0] > 0 else { // "01"
            return 0
        }
        
        dp.append(1) 
        dp.append(1)
        
        for i in 1..<digits.count {
            let plus1 = (1...26).contains(digits[i]) ? dp[i] : 0
            let plus2 = (10...26).contains(digits[i-1] * 10 + digits[i]) ? dp[i-1] : 0
            if plus1 + plus2 == 0 { return 0 }
            dp.append(plus1 + plus2)
        }
        return dp.last!
    }
}