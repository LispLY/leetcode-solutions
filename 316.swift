// passed

class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        // 一个队列：用于表示当前时刻的排序情况，用 stack 实现
        // 保存每个字母最后出现的位置：用于了解当前的字母在将来还会不会出现
        // 每次拿到新的字母：
        // a. 如果还在队列中就丢掉；因为当队列中的字母只剩最后一个时，算法不会丢掉它
        // b. （循环）如果栈顶字母大于现在字母，并且将来还会出现，就丢掉它

        var lastAppear = [Character: Int]()
        for (i, c) in s.enumerated() {
            lastAppear[c] = i
        }
        
        var queue = [Character]()
        for (i, c) in s.enumerated() {
            if queue.contains(c) {
                continue
            }
            while !queue.isEmpty, queue.last! > c, lastAppear[queue.last!]! > i{
                queue.removeLast()
            }
            queue.append(c)
        }
        
        return String(queue)
    }
}