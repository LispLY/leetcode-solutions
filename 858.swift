class Solution {
    func mirrorReflection(_ p: Int, _ q: Int) -> Int {
        // 到角的条件：高和宽同时达到p的倍数
        // 四个角的条件：宽和高分别除以p，模2
        // 0：宽 1 高 0
        // 1：宽 1 高 1
        // 2：宽 0 高 1
        
        // 更新数值：按p更新
        var x = 0, y = 0
        while(true) {
            x += p
            y += q
            if y % p == 0 { // 在角上
                if (x / p) % 2 == 0 {
                    if (y / p) % 2 == 1 {
                        return 2
                    }
                } else {
                    if (y / p) % 2 == 1 {
                        return 1
                    } else {
                        return 0
                    }
                }
            }
        }
    }
}