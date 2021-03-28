class Solution {
    func reinitializePermutation(_ n: Int) -> Int {        
        let perm = Array(0..<n)
        var arr = perm
        var c = 0
        repeat {
            var next = Array(repeating: 0, count: arr.count)
            for i in next.indices {
                next[i] = (i % 2 == 0) ? (arr[i/2]) : (arr[i/2 + arr.count / 2])
            }
            c += 1
            arr = next
        } while arr != perm
        
        return c
    }
}