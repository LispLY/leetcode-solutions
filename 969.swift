// passed
// can't be more effective than O(n2)

class Solution {
    func pancakeSort(_ A: [Int]) -> [Int] {
        // O(n2)
        // 暴力法：找到最大的数，把它交换到开头，把它交换到结尾，and go on
        // 照着做
        let len = A.count
        if len <= 1 { return [Int]() }
        var A = A
        var result = [Int]()
        
        for i in stride(from: len, to: 1, by: -1) { // 对每一个前缀排序
            // i is end index
            
            // find max
            var max = Int.min
            var maxI = -1
            for j in 0..<i {
                if A[j] > max {
                    max = A[j]
                    maxI = j
                }
            }
            if maxI == i-1 { continue }
            
            // result should + 1
            result.append(maxI + 1)
            result.append(i)

            for k in 0...maxI/2 {
                A.swapAt(k, maxI-k)
            }
            for l in 0...(i-1)/2 {
                A.swapAt(l, i-1-l)
            }
        }
        return result
    }
}