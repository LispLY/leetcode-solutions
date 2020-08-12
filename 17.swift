// passed

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        // 先获取数字对应的可能的字母
        let mapper = ["", "", "ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"].map { $0.lowercased() }
        
        if digits.isEmpty { return [String]() }
        
        var result = [""]
        for c in digits {
            let letters = mapper[Int(String(c))!]
            result = letters.map { c in result.map{ str in str + String(c) } }.flatMap { $0 }
        }
        return result
    }
}
