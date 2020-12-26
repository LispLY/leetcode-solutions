class Solution1 {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        //线性时间复杂度，使用一个stack
        var lookup = [Int: Int]() // [num: nextGreaterElement]
        var stack = [Int]()
        for n in nums2 {
            while !stack.isEmpty && stack.last! < n {
                lookup[stack.last!] = n
                stack.removeLast()
            }
            stack.append(n)
        }
        return nums1.map { lookup[$0] ?? -1 }
    }
}

class Solution2 {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // 下一个更大的元素
        // 暴力法 m*n: 对于nums1中任何一个数，在nums2中只需要遍历一次
        
        return nums1.map { n in
            let index = nums2.firstIndex(of: n)!
            let right = nums2[index...]
            return right.first { $0 > n } ?? -1
        }
    }
}