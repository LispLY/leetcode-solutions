class Solution {
    // 插入一颗正的：直接添加
    // 插入一颗负的：或者全部清空，或者自己被干掉，或者同时
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stable = [Int]()
        for a in asteroids {
            if a > 0 {
                 stable.append(a)
            } else {
                // 如果新增的星星清空了全部数组，循环会终止，因为 last < 0
                var survive = true
                while !stable.isEmpty, stable.last! > 0 {
                    if stable.last! < abs(a) {
                        stable.removeLast() 
                    } else if stable.last! == abs(a) {
                        stable.removeLast()
                        survive = false
                        break
                    } else {
                        survive = false
                        break
                    }
                }
                if survive {
                    stable.append(a)
                }
            }
        }
        return stable
    }
}