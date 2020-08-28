/**
 * The rand7() API is already defined in the parent class SolBase.
 * func rand7() -> Int = {}
 * @return a random integer in the range 1 to 7
 */

class Solution0 : SolBase {
    func rand10() -> Int {
        // 怎么把 7 映射到 10

        // 先 roll 一个 1 2 3 4 5
        // 再 roll 一个 123，456
        // roll 不到的接着 roll
        // expectation 7/6 + 7/5 = 77/30 = 2.5666
        
        var five: Int = -1
        var two: Int = -1
        
        repeat {
            five = rand7()
        } while five > 5
        
        repeat {
            two = rand7()
        } while two == 7
        
        return five * 2 - (two % 2)
    }
}

class Solution : SolBase {
    func rand10() -> Int {
        // 把 roll 5 失败的结果用作 roll 2
        // expectation 2/7 * (1 + 7/5) + 5/7(1 + 7/6) = 24/35 + 65/42 = 2.2333
        var five: Int = -1
        var two: Int = 7
        
        repeat {
            five = rand7()
            two = five > 5 ? five - 5 : 7
        } while five > 5
        
        while two == 7 {
            two = rand7()
        }
        
        return five * 2 - (two % 2)
    }
}