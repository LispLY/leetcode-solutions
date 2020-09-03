// passed

class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        // BAD STYLE
        // 要点：字符串的长度必然是子串的整数倍，所以使用字符串长度的因数来遍历。
        let s = Array(s)
        guard s.count > 1 else { return false }

        func repeatedInLen(_ sublen: Int) -> Bool {
            let subnum = s.count / sublen
            for i in 0..<sublen {
                for j in 1..<subnum {
                    if s[i] != s[i + sublen*j] {
                        return false
                    }
                }
            }
            return true
        }

        let sublens = (1...(s.count/2)).filter { s.count % $0 == 0}
        for sublen in sublens {
            if repeatedInLen(sublen) {
                return true
            }
        }
        return false
    }
}

// DP solution from others
class Solution1 {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let s = Array(s)
        let n = s.count
        var dp = [Int](repeating: 0, count: n)
        
        for i in 1..<n {
            var j = dp[i - 1]
            while j > 0, s[i] != s[j] {
                j = dp[j - 1]
            }
            if s[i] == s[j] {
                j += 1
            }
            dp[i] = j
        }
        
        let l = dp[n - 1]
        return l != 0 && (n % (n - l) == 0)
    }
}
