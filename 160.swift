/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        // 计算长度，对齐后两两比较
        func len(_ head: ListNode?) -> Int {
            var n: ListNode? = head
            var c = 0
            while n != nil {
                n = n!.next
                c += 1
            }
            return c
        }
        
        let la = len(headA)
        let lb = len(headB)
        let common = min(la, lb)
        
        var a = headA
        var b = headB
        
        for _ in 0..<(la - common) {
            a = a!.next
        }
        
        for _ in 0..<(lb - common) {
            b = b!.next
        }
        
        while a != nil {
            if a === b {
                return a
            }
            a = a!.next
            b = b!.next
        }

        return nil
    }
}


// 一个别人的精妙的解法
// 相当于把A后面补个B，B后面补个A，这样总长度就相等了
class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        
        var a: ListNode? = headA
        var b: ListNode? = headB
        
        while a !== b {
            a = a == nil ? headB : a?.next
            b = b == nil ? headA : b?.next
        }
        
        return a;

    }
}
