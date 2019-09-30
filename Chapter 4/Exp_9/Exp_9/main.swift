import Foundation


func createDistanceArray(width : Int, height : Int) -> [[Int]]{
    var array = Array(repeating: Array(repeating: 0, count: width), count: height)
    for i in 0..<height{
        for j in 0..<width{
           array[i][j] = min(min(i, height-i-1), min(j, width-j-1))
        }
    }
    return array
}

let array = createDistanceArray(width: 7, height: 5)
for item in array{
    print(item)
}
