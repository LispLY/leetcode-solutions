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
class Solution {
    // 典型的双指针
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummyHead = ListNode(0, head)
        var p1:ListNode? = dummyHead
        var p2:ListNode? = dummyHead
        for _ in 0...n { // p1先走两步
            p1 = p1?.next
        }
        while p1 != nil {
            p1 = p1?.next
            p2 = p2?.next
        }
        p2?.next = p2?.next?.next
        return dummyHead.next
    }
}