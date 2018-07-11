import Foundation

func countingsort(values : inout [Int], min: Int, max: Int){
    let lenght = max - min + 1
    var counts = Array(repeating: 0, count: lenght)
    for i in 0..<values.count{
        counts[values[i]] = counts[values[i]] + 1
    }
    
    var index = 0
    for i in 0..<lenght{
        for _ in 0..<counts[i]{
            values[index] = i
            index = index + 1
        }
    }
}

print("Hello, World!")
var array = [20, 20, 50, 10, 70, 10, 10, 80, 40, 90, 30, 60, 10, 50, 30]
print(array)
countingsort(values: &array, min: 10, max: 100)
print(array)

