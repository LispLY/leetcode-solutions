// 2的幂是有限的，只要比较是否和任何一个2的幂拥有相同的数字就行

class Solution {
    func reorderedPowerOf2(_ N: Int) -> Bool {
        func digits(_ n: Int) -> [Int] {
            var n = n
            var ds = [Int](repeating: 0, count: 10)
            while n > 0 {
                ds[n % 10] += 1
                n /= 10
            }
            return ds
        }
        
        
        var powers = [Int]()
        var p = 1 
        let digitsN = digits(N)
        while p <= 1000000000 {
            if digitsN == digits(p) {
                return true
            }
            p *= 2
        }
        
        return false
    }
    
}