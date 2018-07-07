import Foundation

func createRandomArray(_ count : Int) -> [Int]{
    return (1...count).map{_ in Int(arc4random_uniform(100)) }
}

func findAvarage(_ array : [Int]) -> Double{
    var total = 0;
    for value in array{
        total += value
    }
    return Double(total) / Double(array.count)
}

func findSampleVariance(_ array: [Int]) -> Double {
    let avarage = findAvarage(array)
    var summa = 0.0
    for value in array{
        summa += pow((Double(value) - avarage), 2)
    }
    return summa / Double(array.count)
}

let array = createRandomArray(10)
print("Array: \(array)")
let s = findSampleVariance(array)
print("Sample Variance: \(s)")

