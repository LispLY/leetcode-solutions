// passed

class Solution {
        // 一个循环最多由四次组成
        // 判断四次循环后能否回到原点并且向北
        // 坐标表示状态，方向模4

    struct State {
        var x: Int = 0
        var y: Int = 0
        var direction: Int = 0
        
        mutating func turnL() {
            direction = (direction + 4 - 1) % 4
        }
        
        mutating func turnR() {
            direction = (direction + 1) % 4
        }
        
        mutating func move() {
            switch direction {
                case 0:
                y += 1
                case 1:
                x += 1
                case 2:
                y -= 1
                case 3:
                x -= 1
                default:
                fatalError("wrong direction")
            }
        }
        
        var isOrigin: Bool {
            return x==0 && y==0 && direction==0
        }
    }
    
    func isRobotBounded(_ instructions: String) -> Bool {
        var state = State()
        for _ in 0..<4 {
            for i in instructions {
                switch i {
                    case "G":
                    state.move()
                    case "L":
                    state.turnL()
                    case "R":
                    state.turnR()
                    default:
                    fatalError("wrong instruction")
                }
            }
        }
        return state.isOrigin

    }
}

