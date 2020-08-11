// passed

class Solution1 { // O(n*log(n))
    func hIndex(_ citations: [Int]) -> Int {
        // 最直接的思路：排序后依次检查 c[i] >= i+1
        if citations.isEmpty { return 0 }
        
        for (i, c) in citations.sorted(by: >).enumerated() {
            if c < i + 1 { return i }
        }
        
        return citations.count
    }
}

class Solution { // O(n)
    func hIndex(_ citations: [Int]) -> Int {
        // 空间换时间，桶排？
        // 使用桶存储每个数字出现了多少次，超过最大的放到最大的里面
        // 为了方便，从0开始统计，使用多一格的桶
        if citations.isEmpty { return 0 }

        var bracket = Array(repeating: 0, count: citations.count + 1)

        for c in citations {
            let c = min(c, citations.count)
            bracket[c] += 1
        }
        
        for i in (0..<bracket.count-1).reversed() { // accumulate
            bracket[i] += bracket[i+1]
        }
        
        for (i, c) in bracket.reversed().enumerated() { // i is not reversed!!
            let i = bracket.count - 1 - i // so we reverse it
            if c >= i { return i }
        }
        fatalError()
    }
}