class Solution {
    func longestMountain(_ A: [Int]) -> Int {
        // 长度 >= 3
        // 山顶左右都要有山坡
        // 状态机：
        // 啥时候开始：数组的开头，或者失败的时候
        // 啥时候停止：遇到相等 or 下降状态下遇到上升 or 遍历到了最后！
        guard A.count >= 3 else { return 0 }
        var l = 0
        var meetTop = false
        var result = 0
        for i in 0..<(A.count - 1) {
            let next = A[i+1]

            if next == A[i] { // 结束
                result = max(result, i - l + 1)
                l = i + 1
                meetTop = false
            } else if meetTop, next > A[i] { // 结束，开始点向左一位
                result = max(result, i - l + 1)
                l = i
                meetTop = false
            } else if !meetTop, next < A[i] {
                if i > l { // 有左山坡
                    meetTop = true
                } else { // 没有左山坡，失败
                    l = i + 1
                }
            } // else 正常继续
        }
        // 还要考虑到以最后一个点结束的情况！
        if meetTop {
            result = max(result, A.count - l)
        }
        return result >= 3 ? result : 0
    }
}