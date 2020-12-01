import Foundation

// Find two numbers from the array which sums 2020, multiply after.

// Input: [1721, 979, 366, 299, 675, 1456]
// Output: 514579
// Reasoning: 1721 + 299 = 2020 -- 1721 * 299 = 514579

// Array always have values

// Solution 1: Brute force

// Time: O(n*n) Space: O(1)
public func getValue(_ input: [Int]) -> Int {
    for i in 0..<input.count {
        for j in 0..<input.count {
            if input[i] + input[j] == 2020 {
                return sumValues([input[i], input[j]])
            }
        }
    }
    return 0
}

// Solution 2: Iteration

// Time: O(n) Space: O(n)
public func getOptimizedValue(_ input: [Int]) -> Int {
    var leftPointer = 0
    var numbers: [Int: Int] = [:]
    for (key, value) in input.enumerated() {
        numbers[value] = key
    }
    while leftPointer < input.count - 1 {
        let result = 2020 - input[leftPointer]
        if let _ = numbers[result] {
            return sumValues([input[leftPointer], result])
        }
        leftPointer += 1
    }
    return 0
}

// Helpers

func sumValues(_ input: [Int]) -> Int {
    var value = 0
    print(input)
    for i in input {
        if value == 0 {
            value = i
        } else {
            value = value * i
        }
    }
    return value
}
