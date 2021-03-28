class Solution {
    func countSubstrings(_ s: String) -> Int {
        // 子串数有 n^2 个
        // 从每个候选位置的中心向两边搜索，一旦遇到不合格的就停止
        // 中心可能在 index + 0.5 的位置，两种情况分别搜索
        
        if s.count <= 1 { return s.count }
        
        let arr = Array(s)
        var res = 0
        
        // 以 i 为中心
        for i in arr.indices {
            var offset = 0
            while i - offset >= 0, i + offset < arr.count, arr[i - offset] == arr[i + offset] {
                offset += 1
                res += 1
            }
        }
        
        // 以 i + 0.5 为中心
        for i in 0..<(arr.count - 1) {
            var offset = 0
            while i - offset >= 0, i + 1 + offset < arr.count, arr[i - offset] == arr[i + 1 + offset] {
                offset += 1
                res += 1
            }
        }
        
        return res
    }
}