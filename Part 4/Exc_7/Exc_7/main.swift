import Foundation

func createDiagonalArray(width : Int, height : Int) -> [[Int]] {
    var array = Array(repeating: Array(repeating: 0, count: width), count: height)
    let tgA = Double(height) / Double(width)
    for j in 0..<width{
        let stepHeight = Double(width - j) * tgA
        let rsh = height - Int(round(stepHeight))
        for i in 0..<height{
            if i>=rsh  {
                array[i][j] = 1
            }
        }
    }
    return array
}


let array = createDiagonalArray(width: 8, height: 5)
for item in array{
    print(item)
}

