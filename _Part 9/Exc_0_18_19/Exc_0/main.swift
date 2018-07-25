import Foundation
func select3WithDuplicates(items : [String]) -> [String]{
    var results : [String] = []
    for i in 0..<items.count{
        for j in i..<items.count{
            for k in j..<items.count{
                results.append(items[i] + items[j] + items[k])
            }
        }
    }
    return results
}
//print(select3WithDuplicates(items: ["A","B","C", "D", "E"]))

func select3WithoutDuplicates(items : [String]) -> [String]{
    var results : [String] = []
    for i in 0..<items.count{
        for j in i+1..<items.count{
            for k in j+1..<items.count{
                results.append(items[i] + items[j] + items[k])
            }
        }
    }
    return results
}
//print(select3WithoutDuplicates(items: ["A","B","C", "D", "E"]))

func SelectKofNwithDuplicates(index: Int, selection: inout [Int], items: [String], results : inout [[String]]){
    if index == selection.count{
        var result : [String] = []
        for i in 0..<selection.count{
            result.append(items[selection[i]])
        }
        results.append(result)
    }else{
        var start = 0
        if index > 0{
            start = selection[index - 1]
        }
        for i in start..<items.count{
            selection[index] = i
            SelectKofNwithDuplicates(index: index+1, selection: &selection, items: items, results: &results)
        }
    }
}
var index = 0
var selectons : [Int] = [0,1,2]
var items = ["A","B","C","D","E"]
var results: [[String]] = []

//SelectKofNwithDuplicates(index: index, selection: &selectons, items: items, results: &results)
//print(results)
//print("-----------")


func SelectKofNwitoutDuplicates(index: Int, selection: inout [Int], items: [String], results : inout [[String]]){
    if index == selection.count{
        var result : [String] = []
        for i in 0..<selection.count{
            result.append(items[selection[i]])
        }
        results.append(result)
    }else{
        var start = 0
        if index > 0{
            start = selection[index - 1] + 1
        }
        for i in start..<items.count{
            selection[index] = i
            SelectKofNwitoutDuplicates(index: index+1, selection: &selection, items: items, results: &results)
        }
    }
}
//results = []
//SelectKofNwitoutDuplicates(index: index, selection: &selectons, items: items, results: &results)
//print(results)

func permuteKofNwithDuplicates(index: Int, selection: inout [Int], items: [String], results : inout [[String]]){
    if index == selection.count{
        var result : [String] = []
        for i in 0..<selection.count{
            result.append(items[selection[i]])
        }
        results.append(result)
    }else{
        for i in 0..<items.count{
            selection[index] = i
            permuteKofNwithDuplicates(index: index+1, selection: &selection, items: items, results: &results)
        }
    }
}
results = []
permuteKofNwithDuplicates(index: index, selection: &selectons, items: items, results: &results)
print(results)
print("----------------")

func permuteKofNwithotDuplicates(index: Int, selection: inout [Int], items: [String], results : inout [[String]]){
    if index == selection.count{
        var result : [String] = []
        for i in 0..<selection.count{
            result.append(items[selection[i]])
        }
        results.append(result)
    }else{
        for i in 0..<items.count{
            var used = false
            for j in 0..<(index-1){
                if selectons[j] == i{
                    used = true
                }
            }
            if !used{
                selection[index] = i
                permuteKofNwithotDuplicates(index: index+1, selection: &selection, items: items, results: &results)
            }
        }
    }
}
results = []
permuteKofNwithDuplicates(index: index, selection: &selectons, items: items, results: &results)
print(results)




































