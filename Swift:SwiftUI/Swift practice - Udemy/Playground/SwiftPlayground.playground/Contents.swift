import UIKit

var greeting = "Hello, playground"
print(greeting)

var studentsAndScores = ["Amy": 96, "James": 84, "Kyle": 91]

func highestScores(scores: [String: Int]) {
    
    if scores["John"]  != nil {
        print(scores["John"] ?? 0)
    }
    
}

highestScores(scores: studentsAndScores)
