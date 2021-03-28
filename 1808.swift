class Solution {
    func maxNiceDivisors(_ primeFactors: Int) -> Int {
        // n的质因数的个数小于等于 primeFactors
        // 最大化 nice divisor 的数量
        // nice divisor：能被所有n的质因数整除
        // 
        // 重点不在于是哪个质因数，在于组合的可能性
        
        // 把 p 分成 q 个数，使 q 个数的乘积最大
        
        // 尝试：更多的 3，其余的用 2 或者 4 补齐
        
        if primeFactors == 1 { return 1 }
        if primeFactors == 2 { return 2 }
        
        
        var (threes, other): (Int, Int) = {
            switch primeFactors % 3 {
            case 1:
                return (primeFactors / 3 - 1, 4)
            case 2:
                return (primeFactors / 3, 2)
            default:
                return (primeFactors / 3, 1)    
            }
        }()
        
        var res = other
        
        func pow3(_ n: Int) -> Int {
            switch n {
            case 0:
                return 1
            case 1:
                return 3
            default:
                let half = UInt(pow3(n/2))
                return Int(half &* half &* (n % 2 == 1 ? 3 : 1) % 1000000007)
            }
        }

        return other * pow3(threes) % 1000000007
    }
}