// passed

// 方法一，利用字符串比较
class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let res = nums.map { String($0) }
        .sorted {
            $0 + $1 > $1 + $0
        }
        .joined()
        return res.first == "0" ? "0" : res
    }
}


// 方法二，比较慢，手动比较两个数字
extension Int {
    var nums: [Int] {
        var res = [Int]()
        var num = self
        repeat {
            res.append(num % 10)
            num /= 10
        } while num > 0 
        return res.reversed()
    }
}

class Solution1 {
    func largestNumber(_ nums: [Int]) -> String {
        // 用一个通用的方法把输入数字按“大小”排序
        // 从第一位开始一次向后比
        // 空缺的用末位补齐❌ 互相补齐对方！
        
        // return true if the left one is larger
        func larger(l: Int, r: Int) -> Bool {
            let ln = l.nums
            let rn = r.nums
            let l = ln + rn
            let r = rn + ln
            let len = l.count
            for i in 0..<len {
                if l[i] == r[i] {
                    continue
                }
                return l[i] > r[i]
            }
            return true // equal, so what ever
        }
        
        var res = nums.sorted(by: larger).map { String($0) }.joined()
        return res.first == "0" ? "0" : res
    }
}
