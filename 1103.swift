// passed, easy


// brutal force
class Solution1 { 
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        var remain = candies
        var result = Array(repeating: 0, count: num_people)
        var nextIndex = 0
        var amount = 1
        while remain > 0 {
            let amountToGive = min(remain, amount)
            result[nextIndex] += amountToGive
            amount += 1
            remain -= amountToGive
            nextIndex = (nextIndex + 1) % num_people
        }
        return result
    }
}

// calculate per turn
// turn N: (1 + num_people) * num_people / 2 +  N * num_people
