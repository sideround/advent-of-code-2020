import Foundation

// Based on instructions, determine if the Password is valid

// We will always have values

public struct Instruction {
    let range: ClosedRange<Int>
    let letter: String
    let value: String
    
    public init(range: ClosedRange<Int>, letter: String, value: String) {
        self.range = range
        self.letter = letter
        self.value = value
    }
}

// Time: O(n*m) Space: O(1)
public func isValid(instructions: [Instruction]) -> Int {
    var numberOfOutcomes = 0
    var leftPointer = 0
    
    while leftPointer <= instructions.count - 1 {
        if checkPassword(range: instructions[leftPointer].range, letter: instructions[leftPointer].letter, value: instructions[leftPointer].value) {
            numberOfOutcomes += 1
        }
        leftPointer += 1
    }
    
    return numberOfOutcomes
}

public func checkPassword(range: ClosedRange<Int>, letter: String, value: String) -> Bool {
    var count: Int = 0
    for i in value {
        if letter.contains(i) {
            count += 1
        }
    }
    return range.contains(count)
}
