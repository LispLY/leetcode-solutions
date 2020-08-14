// passed
// 相对于字典保存结果，还有两种方法: 直接用数组根据index映射，或者用集合（加进去-拿出来，每次拿出来+2）

class Solution {
    // 偶数个的取全部长度
    // 如果至少有一个奇数个，+1 ❌ 应该是个数模2！！！
    func longestPalindrome(_ s: String) -> Int {
        var store = [Character: Int]()
        for c in s {
            if store[c] == nil {
                store[c] = 1
            } else {
                store[c]! += 1
            }
        }
        var hasOdd = false
        var result = 0
        for (_, v) in store {
            if v % 2 == 0 {
                result += v
            } else {
                result += v-1
                hasOdd = true
            }
        }
        
        return hasOdd ? result + 1 : result
    }
}