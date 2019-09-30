//
//  main.swift
//  Exc_7
//
//  Created by Lsgsk on 20/09/2019.
//  Copyright © 2019 Lsgsk. All rights reserved.
//

import Foundation

func rundomSearch(collectionToDivide: [Int]) {
	let numTrials = 50
	var bestSolution: [Int] = []
	let totalSum = collectionToDivide.reduce(0, +)
	
	loop: for _ in 0..<numTrials {
		var firstBasketIndexes: [Int] = []
		for index in 0..<collectionToDivide.count {
			if Bool.random() {
				firstBasketIndexes.append(index)
			}
			
			let sumOfFirstBusket = firstBasketIndexes.map { collectionToDivide[$0] }.reduce(0, +)
			let sumOfBestBusket = bestSolution.map { collectionToDivide[$0] }.reduce(0, +)
			
			if (totalSum - sumOfFirstBusket * 2 >= 0) && (totalSum - sumOfFirstBusket * 2 <= totalSum - sumOfBestBusket * 2) {
				bestSolution = firstBasketIndexes
				print("\(totalSum - sumOfFirstBusket * 2)")
				if totalSum - sumOfFirstBusket * 2 == 0 {
					break loop
				}
			}
		}
	}
	let busket1 = bestSolution.map { collectionToDivide[$0] }
	let busket2 = (0..<collectionToDivide.count).filter { !bestSolution.contains($0) }.map { collectionToDivide[$0] }
	print("There is the best founded solution. Busket 1: \(busket1), busket 2: \(busket2)")
}

rundomSearch(collectionToDivide: [2, 4, 1, 1, 2, 1, 3, 5, 3, 2])
