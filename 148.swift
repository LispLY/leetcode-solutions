 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
 
 class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        // 链表排序
        // 常数空间； O(n logn) 时间
        // 中分链表，返回 合并“已排序的子链表”的结果
        // 规约成 “合并已排序的链表” 问题
        guard let head = head else {
            return nil
        }
        
        func recurv(_ head: ListNode?, _ count: Int) -> ListNode? {
            switch count {
            case 0:
                return nil
            case 1:
                return head
            default:
                // divide
                let mid = count / 2 // index of the first of right
                var llast = head!
                for _ in 0..<(mid - 1) {
                    llast = llast.next!
                }
                var r = llast.next
                llast.next = nil
                
                var l = recurv(head, mid)
                r = recurv(r, count - mid)
                
                // merge
                let res = ListNode(0) // dumb head
                var cur = res
                while l != nil, r != nil {
                    if l!.val < r!.val {
                        cur.next = l
                        l = l!.next
                    } else {
                        cur.next = r
                        r = r!.next
                    }
                    cur = cur.next!
                }
                cur.next = (l != nil) ? l : r
                return res.next
            }
        }
        
        var count = 0
        var node: ListNode? = head
        while node != nil {
            node = node!.next
            count += 1
        }
        return recurv(head, count)
    }
 }
