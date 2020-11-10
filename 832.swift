class Solution1 {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        // 需要两次访问内存
        var r = A
        let rowLen = r[0].count
        for i in r.indices {
            for j in 0..<((rowLen + 1) / 2) {
                (r[i][j], r[i][rowLen - 1 - j]) = (r[i][rowLen - 1 - j]^1, r[i][j]^1)
            }
        }
        return r
    }
}

class Solution2 {    
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var r = [[Int]]()
        for row in A.indices {
            r.append([])
            for n in A[row].reversed() {
                r[row].append(n^1)
            }
        }
        return r
    }
}