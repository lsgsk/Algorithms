//
//  main.swift
//  Exc_15
//
//  Created by Lsgsk on 15.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

func printBoard(_ board: [[Int]]){
    var str = ""
    for row in 0..<board.count{
        for col in 0..<board.count{
            str += "\(board[row][col]) "
        }
        str += "\n"
    }
    str += "-------------------------------------"
    print(str)
}


func KnightsTour(row : Int, col : Int, move_numbers: inout [[Int]], num_moves_taken: Int) -> Bool{
    var num = num_moves_taken
    num += 1
    move_numbers[row][col] = num
    if num == move_numbers.count * move_numbers.count{
        return true
    }
    let dRow = [ -2, -2, -1, 1, 2, 2, 1, -1 ]
    let dCol = [ -1, 1, 2, 2, 1, -1, -2, -2 ]
    for i in 0...7{
        let r = row + dRow[i]
        let c = col + dCol[i]
        if ((r >= 0) && (r < move_numbers.count) && c >= 0 && c < move_numbers.count && move_numbers[r][c] == 0){
            //printBoard(move_numbers)
            if KnightsTour(row: r, col: c, move_numbers: &move_numbers, num_moves_taken: num){
                return true
            }
        }
    }
    move_numbers[row][col] = 0
    return false
}
var board = Array(repeating: Array(repeating: 0, count:5), count: 5)
if KnightsTour(row: 2, col: 2, move_numbers: &board, num_moves_taken: 0){
    printBoard(board)
}
print("Hello, World!")

