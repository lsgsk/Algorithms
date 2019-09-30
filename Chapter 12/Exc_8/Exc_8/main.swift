//
//  main.swift
//  Exc_7
//
//  Created by Lsgsk on 20/09/2019.
//  Copyright © 2019 Lsgsk. All rights reserved.
//

import Foundation

func makeImprovements(collectionToDivide: [Int]) {
	let numTrials = 10
	let maxIndex = collectionToDivide.count-1
	var bestSolution: [Int] = []
	let totalSum = collectionToDivide.reduce(0, +)
	
	loop: for _ in 0..<numTrials {
		var firstBasketIndexes: [Int] = []
		for index in 0...maxIndex {
			if Bool.random() {
				firstBasketIndexes.append(index)
			}
		}
		
		var hadImprovement = true
		while hadImprovement {
			hadImprovement = false
			for index in 0...maxIndex {
				let sumOfFirstBusketBeforeImprovement = firstBasketIndexes.map { collectionToDivide[$0] }.reduce(0, +)
				if let existIndex = firstBasketIndexes.firstIndex(of: index) {
					firstBasketIndexes.remove(at: existIndex)
				}
				else {
					firstBasketIndexes.append(index)
				}
				let sumOfFirstBusketAfterImprovement = firstBasketIndexes.map { collectionToDivide[$0] }.reduce(0, +)
				if (sumOfFirstBusketAfterImprovement > sumOfFirstBusketBeforeImprovement) && ((totalSum - 2 * sumOfFirstBusketAfterImprovement) >= 0) {
					bestSolution = firstBasketIndexes
					if totalSum - 2 * sumOfFirstBusketAfterImprovement == 0 {
						print("Solution has founded")
						break loop
					}
				}
			}
		}
	}
	let busket1 = bestSolution.map { collectionToDivide[$0] }
	let busket2 = (0..<collectionToDivide.count).filter { !bestSolution.contains($0) }.map { collectionToDivide[$0] }
	print("There is the best founded solution. Busket 1: \(busket1), busket 2: \(busket2)")
}

makeImprovements(collectionToDivide: [2, 4, 1, 1, 2, 1, 3, 5, 3, 2])
