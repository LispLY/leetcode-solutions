// passed

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        (1...n).map { num in
            switch num {
            case let num where num % 15 == 0:
                return "FizzBuzz"
            case let num where num % 3 == 0:
                return "Fizz"
            case let num where num % 5 == 0:
                return "Buzz"
            default:
                return String(num)
            }
        }
    }
}
