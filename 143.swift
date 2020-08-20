// passed
// 有递归和循环两种解法，递归的话，中间切断，反转后半段，再交替连接（使用双指针找中点）

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
    func reorderList(_ head: ListNode?) {
        // 使用stack来从后向前获取
        guard head != nil else { return }
        
        var stack = [ListNode]()
        
        var nd: ListNode? = head
        while nd != nil {
            stack.append(nd!)
            nd = nd!.next
        }
        
        var cur = head
        while true {
            let fromHead = cur!.next
            let fromTail = stack.removeLast()
            
            if fromTail === cur {
                cur?.next = nil
                break
            }
            cur!.next = fromTail
            cur = fromTail
            
            if fromHead === cur {
                cur?.next = nil
                break
            }
            cur!.next = fromHead
            cur = fromHead
        }
    }
}
