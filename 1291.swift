// passed

class Solution {
    static let template = [
        123456789,
        23456789,
        3456789,
        456789,
        56789,
        6789,
        789,
        89,
    ]
    
    static let all: [Int] = { 
        func shift(_ num: Int, _ d: Int) -> Int {
            var res = num
            for _ in 0..<d {
                res /= 10
            }
            return res
        }
        
        var result = [Int]()
        for digits in 2...9 {
            for i in 0...(9 - digits) {
                let len = 9 - i
                var next = Solution.template[i]
                result.append(shift(Solution.template[i], len - digits))
            }
        }
        return result
    }()
        
        
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        return Solution.all.filter { $0 >= low && $0 <= high }
    }
}