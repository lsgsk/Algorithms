import Foundation

func selectionSort(_ query : ListQueue<Int>){
    let count = query.count
    let tempQuery = ListQueue<Int>()
    for i in 0..<count{
        if var max = query.Dequeue(){
            for _ in (i+1)..<count{
                if let item = query.Dequeue(){
                    if item > max{
                        tempQuery.Enqueue(value: max)
                        max = item
                    }else{
                        tempQuery.Enqueue(value: item)
                    }}
            }
            print(max)
            while let item = query.Dequeue(){
                tempQuery.Enqueue(value: item)
            }
            while let item = tempQuery.Dequeue(){
                query.Enqueue(value: item)
            }
            query.Enqueue(value: max)
            print(query)
        }
    }
}

func inserctionSort(_ query : ListQueue<Int>){
    let count = query.count
    let tempQuery = ListQueue<Int>()
    for i in 0..<count{
        if var toInsert = query.Dequeue(){
            print("Selected \(toInsert)")
            for _ in 0..<count - i - 1{
                if let item = query.Dequeue(){
                    tempQuery.Enqueue(value: item)
                }
            }
            print("Temp: \(tempQuery)")
            while let item = tempQuery.Dequeue(){
                query.Enqueue(value: item)
            }
            for _ in 0..<i {
                if let item = query.Dequeue(){
                    if toInsert > item{
                        query.Enqueue(value: toInsert)
                        toInsert = Int.min
                    }
                    query.Enqueue(value: item)
                }
            }
            if toInsert != Int.min{
                   query.Enqueue(value: toInsert)
            }
            print(query)
        }
    }
}


var queue = ListQueue<Int>()
queue.Enqueue(value: 2)
queue.Enqueue(value: 1)
queue.Enqueue(value: 5)
queue.Enqueue(value: 0)
queue.Enqueue(value: 4)
selectionSort(queue)
//inserctionSort(queue)
print(queue)
