class Solution {
    let radius: Double
    let x_center: Double
    let y_center: Double
    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        self.radius = radius
        self.x_center = x_center
        self.y_center = y_center
    }
    
    func randPoint() -> [Double] {
        while true {
            let x_offset = Double.random(in: (-radius)...radius)
            let y_offset = Double.random(in: (-radius)...radius)
            if (x_offset * x_offset) + (y_offset * y_offset) <= radius * radius {
                return [x_offset + x_center, y_offset + y_center];
            }
        }
        fatalError()
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(radius, x_center, y_center)
 * let ret_1: [Double] = obj.randPoint()
 */