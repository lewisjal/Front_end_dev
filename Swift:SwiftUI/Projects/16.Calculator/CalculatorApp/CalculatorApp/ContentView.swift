//
//  ContentView.swift
//  CalculatorApp
//
//  Created by M_955328 on 3/21/22.
//

import SwiftUI

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case clear = "C"
    case multiply = "X"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    case equal = "="
    
    var buttonColor: Color {
        switch self {
        case .add, .multiply, .subtract, .equal:
            return .orange
        case .clear:
            return .gray
        default:
            return Color(hue: 1.0, saturation: 0.0, brightness: 0.283)
        }
    }
}

enum Operation{
    case add, subtract, multiply, none
}

struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalcButton]] = [
        [.one, .two, .three, .multiply],
        [.four, .five, .six, .subtract],
        [.seven, .eight, .nine, .add],
        [.zero, .clear, .equal ]
    ]
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text(value).bold().font(.system(size: 80)).foregroundColor(.white)
                }.padding(.trailing, 160)
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 1){
                        ForEach(row, id: \.self) {item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(item: item), height: self.buttonHeight())
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item) / 2)
                            })
                        }
                    }.padding(.bottom, 3)
                }
            }
            
        }
    }
    
    func didTap(button: CalcButton){
        switch button{
        case .add, .subtract, .multiply, .equal:
            if button == .add{
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtract{
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0

            }
            else if button == .multiply{
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0

            }
            else if button == .equal{
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation{
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .none:
                    break
                }
            }
            if button != .equal{
                self.value = "0"
            }
        case .clear:
            self.value = "0"
            break
        default:
            let number = button.rawValue
            if self.value == "0"{
                value = number
            }
            else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero{
            return ((UIScreen.main.bounds.width - (2/12)) / 4) * 2

        }
        return (UIScreen.main.bounds.width - (3/12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (3/12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
