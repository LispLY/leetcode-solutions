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
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        // 插入排序：把每个刚进来的数插到合适的位置 
        // 1. 找到节点：每次取下tail的下一个节点作为目标，把tail的next连到target的下一个节点
        // 2. 插入：把节点插入到截止到tail的第一个大于它的节点的前面；如果没有，插到tail后面，成为新的tail
        // 头可能会变，所以需要一个假的头

        let head = ListNode(Int.min, head)
        var tail: ListNode = head // 已排序的最后一个节点
        
        // var target: ListNode? = tail.next
        while tail.next != nil {
            let target: ListNode = tail.next!
            // 如果已经大于tail了就相当于已经排完了
            if (target.val >= tail.val) {
                tail = tail.next!
                continue
            }
            
            // 从链表中去除target
            tail.next = target.next 
            // 对target进行插入
            var cur: ListNode = head // 当前比较对象
            var last: ListNode! // 比较对象的上一个
            
            while target.val > cur.val {
                last = cur
                cur = cur.next!
            } 
            // 现在 target.val <= cur.val
            
            // 插入target
            target.next = cur
            last.next = target
        }
        
        return head.next
    }
}