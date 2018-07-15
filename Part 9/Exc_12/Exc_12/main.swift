import Foundation

func printBoard(_ spot_taken: [[Bool]]){
    var str = ""
    for row in 0..<spot_taken.count{
        for col in 0..<spot_taken.count{
            str += spot_taken[row][col] ? "* " : "_ "
        }
        str += "\n"
    }
    str += "-------------------------------------"
    print(str)
}

func isLegal(_ spot_taken: [[Bool]]) -> Bool {
    for row in 0..<spot_taken.count{
        for col in 0..<spot_taken.count{
            if spot_taken[row][col]{
                
                for k in 0..<spot_taken.count{
                    if k == col { continue }
                    if k == row { continue }
                    if spot_taken[row][k] || spot_taken[k][col]
                    {
                        return false
                    }
                    let df = min(row, col)
                    var rd = row+k-df
                    var cd = col+k-df
                    if cd >= 0 && rd >= 0 && rd < spot_taken.count && cd < spot_taken.count{
                        if spot_taken[rd][cd]{
                            return false
                        }
                    }
                    rd = row+k-df
                    cd = col-k+df
                    if cd >= 0 && rd >= 0 &&  rd < spot_taken.count && cd < spot_taken.count{
                        if spot_taken[rd][cd]{
                            return false
                        }
                    }
                }
            }
        }
    }
    //printBoard(spot_taken)
    return true
}

func EightQueens(_ spot_taken: inout [[Bool]], _ num_queens_positioned: Int) -> Bool{
    if !isLegal(spot_taken){
        return false
    }
    if num_queens_positioned == spot_taken.count{
        printBoard(spot_taken)
        return true
    }
    for row in 0..<spot_taken.count{
        for col in 0..<spot_taken.count{
            //print("\(row)/\(col)")
            if !spot_taken[row][col]{
                spot_taken[row][col] = true
                //printBoard(spot_taken)
                if EightQueens(&spot_taken, num_queens_positioned+1){
                    return true
                }
                spot_taken[row][col] = false
            }
        }
    }
    return false
}

print("Hello, World!")
var count = 5
var board = Array(repeating: Array(repeating: false, count: count), count: count)
EightQueens(&board, 0)

