class Codec {
    // 无损压缩的想法是不行的，域名可以要多长有多长
    // 简单的使用hash的方法，加一个尾数区分碰撞的情况
    // 标准取8位 + 碰撞的序号
    
    private let map: [Int: Character] = {
        var map = [Int: Character]()
        for i in 97...122 {
            map[i - 97] = Character(UnicodeScalar(UInt8(i)))
        }
        for i in 0...5 {
            map[i + 26] = Character(UnicodeScalar(UInt8(i + 48)))
        }
        return map
    }()
    
    private var dict = [String: String]()
    private var offset = [String: Int]()
    
    private func hash2str(_ hash: Int) -> String {
        var hash = abs(hash) // to make it easy
        var res = ""
        for _ in 0..<8 {
            let bit = hash % (1 << 5)
            let char = map[bit]!
            res.append(char)
            hash >> 8
        }
        return res
    }
    
    
    // Encodes a URL to a shortened URL.
    func encode(_ longUrl: String) -> String {
        let base = hash2str(longUrl.hash)
        if dict[base] == nil {
            dict[base] = longUrl
            return base
        } else {
            offset[base, default: 0] += 1
            let tail = String(offset[base]!)
            let res = base + tail
            dict[res] = longUrl
            return res
        }
    }
    
    // Decodes a shortened URL to its original URL.
    func decode(_ shortUrl: String) -> String {
        return dict[shortUrl]!
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(longUrl)
 * let ans = obj.decode(s)
*/
