// passed

// We can use string.asciiValue instead of scalar.value
class Solution {
    func titleToNumber(_ s: String) -> Int {
        var res = 0
        for c in s {
            res *= 26
            let val = Unicode.Scalar(String(c))!.value
            res += Int(val - Unicode.Scalar("A").value + 1)
        }
        return res
    }
}