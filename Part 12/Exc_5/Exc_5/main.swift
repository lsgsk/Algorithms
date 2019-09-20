import Foundation

func startBranchAndBound(collectionToDivide: [Int]) {
	var firstBasketIndexes: [Int] = []
	var bestSolution: [Int]? = nil
	var totalSum = collectionToDivide.reduce(0, +)
	var iterationsCount = 0
	
	let firstBusketSum: () -> Int = {
		return firstBasketIndexes.map { collectionToDivide[$0] }.reduce(0, +)
	}
	let secondBusketSum: (Int) -> Int = {
		return (0..<$0).filter { !firstBasketIndexes.contains($0) }.map { collectionToDivide[$0] }.reduce(0, +)
	}
	
	func branchAndBound(nextIndex: Int) {
		iterationsCount += 1
		if nextIndex > collectionToDivide.count-1 {
			if totalSum == firstBusketSum() * 2 {
				bestSolution = firstBasketIndexes
			}
		}
		else {
			if firstBusketSum() * 2 > totalSum || secondBusketSum(nextIndex) * 2 > totalSum {
				return
			}
			firstBasketIndexes.append(nextIndex)
			branchAndBound(nextIndex: nextIndex + 1)
			firstBasketIndexes.removeLast()
			branchAndBound(nextIndex: nextIndex + 1)
		}
	}
	branchAndBound(nextIndex: 0)
	if let bestSolution = bestSolution {
		let busket1 = bestSolution.map { collectionToDivide[$0] }
		let busket2 = (0..<collectionToDivide.count).filter { !bestSolution.contains($0) }.map { collectionToDivide[$0] }
		print("There is solution. Busket 1: \(busket1), busket 2: \(busket2)")
	}
	else {
		print("There is no solution")
	}
	print("Iterations: \(iterationsCount)")
}

startBranchAndBound(collectionToDivide: [2, 4, 1, 1, 2, 1, 3, 5, 3, 2])

