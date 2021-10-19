//
//  ViewController.swift
//  CalculatorTutorial
//
//  Created by Macbookbro on 10/18/21.
//

import UIKit

class UIKitViewController: UIViewController {

    @IBOutlet weak var lblWorkingArea: UILabel!
    @IBOutlet weak var lblResultArea: UILabel!

    var workings:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // swift ui project calculator is the best feelings of all time of the thing we all believe on

    }

    // MARK : - click functions in calculator

    func clearAll() {
        workings = ""
        lblWorkingArea.text = ""
        lblResultArea.text = ""
    }

    func clearLast(){

    }

    func addToWorkingArea(value: String){
        workings = workings + value
        lblWorkingArea.text = workings
    }

    @IBAction func clearAllTap(_ sender: Any) {
        clearAll()

    }

    @IBAction func clearLastTap(_ sender: Any) {

        if(!workings.isEmpty)
        {
            workings.removeLast()
            lblWorkingArea.text = workings
        }

    }

    @IBAction func percentTap(_ sender: Any) {
        addToWorkingArea(value: "%")
    }

    @IBAction func divideTap(_ sender: Any) {
        addToWorkingArea(value: "/")
    }

    @IBAction func mulibleTap(_ sender: Any) {
        addToWorkingArea(value: "*")
    }

    @IBAction func subtractTap(_ sender: Any) {
        addToWorkingArea(value: "-")
    }

    @IBAction func AdditionTap(_ sender: Any) {
        addToWorkingArea(value: "+")
    }

    @IBAction func equalTap(_ sender: Any) {

        if(validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            lblResultArea.text = resultString
        }
        else
        {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }

    }

    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()

        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }

        var previous: Int = -1

        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }

            if(index == workings.count - 1)
            {
                return false
            }

            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }

        return true
    }

    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }

    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }


    @IBAction func dotTap(_ sender: Any) {
        addToWorkingArea(value: ".")
    }

    @IBAction func zeroTap(_ sender: Any) {
        addToWorkingArea(value: "0")
    }

    @IBAction func oneTap(_ sender: Any)
    {
        addToWorkingArea(value: "1")
    }

    @IBAction func twoTap(_ sender: Any)
    {
        addToWorkingArea(value: "2")
    }

    @IBAction func threeTap(_ sender: Any)
    {
        addToWorkingArea(value: "3")
    }

    @IBAction func fourTap(_ sender: Any)
    {
        addToWorkingArea(value: "4")
    }

    @IBAction func fiveTap(_ sender: Any)
    {
        addToWorkingArea(value: "5")
    }

    @IBAction func sixTap(_ sender: Any)
    {
        addToWorkingArea(value: "6")
    }

    @IBAction func sevenTap(_ sender: Any)
    {
        addToWorkingArea(value: "7")
    }

    @IBAction func eightTap(_ sender: Any)
    {
        addToWorkingArea(value: "8")
    }

    @IBAction func nineTap(_ sender: Any)
    {
        addToWorkingArea(value: "9")
    }

}

