class Solution {
    func checkOnesSegment(_ s: String) -> Bool {
        // 0 后有 1 false
        var zero = false
        for c in s {
            if c == Character("0") {
                zero = true
            }
            if zero && c == Character("1") {
                return false
            }
        }
        return true
    }
}