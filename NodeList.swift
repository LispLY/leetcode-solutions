public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    static func from(array: [Int]) -> ListNode? {
        var head: ListNode?
        var last: ListNode?
        for i in 0..<array.count {
            let cur = ListNode(array[i])
            if head == nil {
                head = cur
                last = cur
            } else {
                last?.next = cur
                last = cur
            }
        }
        return head
    }
    
    func toArray() -> [Int] {
        var result = [Int]()
        var cur: ListNode? = self
        while cur != nil {
            result.append(cur!.val)
            cur = cur!.next
        }
        return result
    }
}


//let nodes = ListNode.from(array: Array(0..<10))
//print(nodes?.toArray())
