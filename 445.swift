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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 应该不存在online方法
        var n1 = [Int]()
        var n2 = [Int]()
        
        var l1 = l1, l2 = l2
        while l1 != nil {
            n1.append(l1!.val)
            l1 = l1!.next
        }
        while l2 != nil {
            n2.append(l2!.val)
            l2 = l2!.next
        }
        n1 = n1.reversed() // 现在低位在最前面
        n2 = n2.reversed()
        
        let len = max(n1.count, n2.count) + 1
        n1 += Array(repeating: 0, count: len - n1.count)
        n2 += Array(repeating: 0, count: len - n2.count)
        
        var carry = 0
        var result = Array(repeating: 0, count: len) 
        for i in 0..<len {
            let d = n1[i] + n2[i] + carry
            result[i] = d % 10
            carry = d / 10
        }

        var head = ListNode(-1)
        var node = head
        for d in result.reversed() {
            let newNode = ListNode(d)
            node.next = newNode
            node = newNode
        }
        if head.next!.val == 0 {
            return head.next!.next
        } else {
            return head.next
        }
    }
}

// 没有考虑到溢出的情况
// class Solution {
//     func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//         // 应该不存在online方法
//         var n1 = 0
//         var n2 = 0
        
//         var l1 = l1, l2 = l2
//         while l1 != nil {
//             n1 = n1 * 10 + l1!.val
//             l1 = l1!.next
//         }
//         while l2 != nil {
//             n2 = n2 * 10 + l2!.val
//             l2 = l2!.next
//         }
        
//         var result = n1 + n2
//         if result == 0 { return ListNode(0) }
        
//         let digits = String(result).map { Int(String($0))! }
        
//         var head = ListNode(-1)
//         var node = head
//         for d in digits {
//             let newNode = ListNode(d)
//             node.next = newNode
//             node = newNode
//         }
        
//         return head.next
//     }
// }