// passed

// 是4的幂不是4的倍数！！！
// 4的幂的特点 奇数的0 + 1 + 偶数的0
func isPowerOfFour(_ num: Int) -> Bool {
    var num = num
    while num > 0 {
        if num == 1 { return true }
        if num & 3 != 0 { return false }
        num >>= 2
    }
    return false
}

// without loop or recursion - by others
class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        if num == 1 { return true }
        
        return (num & (num-1) == 0) && (num % 3) == 1
    }
}

// num + ~num = 0
// num - 1: 从右往左把0变成1直到遇到第一个1，把1变成0，然后结束

// test
isPowerOfFour(1024)
isPowerOfFour(200)
isPowerOfFour(99)
isPowerOfFour(0)
isPowerOfFour(1)
