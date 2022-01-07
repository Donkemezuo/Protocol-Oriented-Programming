import Cocoa

var greeting = "Hello, playground"

/*
 Given an array of N positive integers, print k largest elements from the array.
 */
// Solution 1 - Using inbuilt sort method
func find_k_largestElements(arr: [Int], k: Int) -> [Int] {
    guard k < arr.count else { return arr }
    let sortedArr = arr.sorted{ $0 < $1 }
    var results = [Int]()
    var largestElementIndex = sortedArr.count - 1
    while (results.count < k) {
        results.append(sortedArr[largestElementIndex])
        largestElementIndex -= 1
    }
    
    return results
}


func find_k_largestElements_solution2(arr: [Int], k: Int) -> [Int] {
    guard k < arr.count else { return arr }
    var sortedArr = arr
    var result = [Int]()
    for _ in 0..<sortedArr.count {
        for j in 0..<sortedArr.count - 1 {
            if sortedArr[j] < sortedArr[j + 1] {
                sortedArr.swapAt(j, j + 1)
            }
        }
    }
    for i in 0..<k {
        result.append(sortedArr[i])
    }
    return result
}


let arr = [12,5,787,1,23]
let arr2 = [1,23,12,9,30,2,50]
print(find_k_largestElements_solution2(arr: arr2, k: 3))
