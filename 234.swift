/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head?.next == nil { return true }
        
        var fast = head
        var slow = head
        var leftlen = 0
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            leftlen += 1
        }
        // 右边的长度 >= 左边
        
        var right = slow
        var n = right?.next
        var nn = right?.next?.next
        right?.next = nil
        
        while n != nil {
            n!.next = right
            right = n
            n = nn
            nn = n?.next
        }
        
        var left = head
        for _ in 0..<leftlen {
            if left!.val != right!.val {
                return false
            }
            left = left!.next
            right = right!.next
        }
        return true
    }
}