import UIKit
import CoreGraphics




class Human {
    
    var leg: String?
    
    func moveBody() {
        if let leg = leg{
            leg  = "leg"
            print(leg)
        }
    }
}








//extension UIButton {
//
//    func makeCircular(){
//        self.clipsToBounds = true
//        self.layer.cornerRadius = self.frame.size.width / 2
//    }
//}
//
//let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//button.backgroundColor = .red
//
//button.makeCircular()




/*
func exercise() {

    // Define the User struct here
    struct User {
        var name: String
        var email: String?
        var followers: Int
        var isActive: Bool
        
        func logStatus(){
            if isActive{
                print("\(self.name) is working hard")
            }else{
                print("\(self.name) has left earth")
            }
        }
        
    

    // Initialise a User struct here
        init(name: String, email: String, followers: Int, isActive: Bool){
            self.name = name
            self.email = email
            self.followers = followers
            self.isActive = isActive

        }
    }
 



    // Diagnostic code - do not change this code
    print("\nDiagnostic code (i.e., Challenge Hint):")
    var musk = User(name: "Elon", email: "elon@tesla.com", followers: 2001, isActive: true)
    musk.logStatus()
    print("Contacting \(musk.name) on \(musk.email!) ...")
    print("\(musk.name) has \(musk.followers) followers")
    // sometime later
    musk.isActive = false
    musk.logStatus()
    
}

exercise()
 


extension Double {
    func round(to places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}

let myDouble = 3.14159

myDouble.round(to: 2)
 
 */
