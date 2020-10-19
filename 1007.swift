class Solution {
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
        // 先判断有没有可能性：即任何一个点数等于总数（同一张排上的算一个）
        // 最多有两个点有可能，如果是两个点的话，任选一个就好，结果是一样的
        // 对于要翻转的，判断是翻到上面还是翻到下面：看上下分别缺几个
        // 理论上可以一趟解决，但没必要
        var nums = Array(repeating: 0, count: 7)
        for i in A.indices {
            let n1 = A[i], n2 = B[i]
            nums[n1] += 1
            if n1 != n2 {
                nums[n2] += 1
            }
        }
        let maxN = nums.max()!
        guard maxN == A.count else { return -1 }
        let n = nums.index(of: maxN)!
        
        let lack = { (array: [Int]) in 
                    array.reduce(0) { $0 + ($1 == n ? 0 : 1) }}
        let top = lack(A) // lack
        let bottom = lack(B)
        return min(top, bottom)
    }
}