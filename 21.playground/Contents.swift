// passed

import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// 问题：绑定会带来一个新的变量，而遍历需要持有原来的变量
class Solution {
    // 双指针，小的加入并前进
    // 剩下的一并加入
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode()
        var cur: ListNode! = head
        var l1 = l1
        var l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                cur.next = l1
                l1 = l1!.next
            } else {
                cur.next = l2
                l2 = l2!.next
            }
            cur = cur.next
        }
        if l1 != nil {
            cur.next = l1
        }
        if l2 != nil {
            cur.next = l2
        }
        return head.next
    }
}

