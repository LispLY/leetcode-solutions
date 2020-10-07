// passed

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

 // 这个实现过于啰嗦了，而且双指针是不必要的
 
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { // 不绑定，因为后面一直需要 optional 的变量
            return nil
        }
        
        // 从后面取出 k % count 放到最前面

        // k对链表长度取模
        var k = k
        var count = 0
        var node = head
        while node != nil {
            node = node!.next
            count += 1 
            if count > k {
                count = -1
                break
            }
        }
        if count > 0 { 
            k %= count
        }
        
        // 使用双指针得到新的头和尾
        var fast = head
        var slow = head
        for _ in 0..<k {
            fast = fast!.next
        }
        while fast!.next != nil { // k < count
            fast = fast!.next
            slow = slow!.next
        }
        
        // fast 现在是最后一个节点
        fast!.next = head
        
        // slow 现在是旋转后的最后一个节点
        let newHead = slow!.next
        slow!.next = nil
        
        return newHead
    }
}