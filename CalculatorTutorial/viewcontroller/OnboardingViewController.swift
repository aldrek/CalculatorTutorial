//
//  OnboardingViewController.swift
//  CalculatorTutorial
//
//  Created by Macbookbro on 10/19/21.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var swiftUIlbl: UILabel!
    @IBOutlet weak var uiKitlbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        /// Adding gesture for lable so it can be clickable for both uiKitlbl, swiftUIlbl
        let uiKitTap = UITapGestureRecognizer(target: self, action: #selector(OnboardingViewController.uiKitTapFunction))
        uiKitlbl.isUserInteractionEnabled = true
        uiKitlbl.addGestureRecognizer(uiKitTap)

        let swiftUITap = UITapGestureRecognizer(target: self, action: #selector(OnboardingViewController.swiftUITapFunction))
        swiftUIlbl.isUserInteractionEnabled = true
        swiftUIlbl.addGestureRecognizer(swiftUITap)


        // Do any additional setup after loading the view.
    }

    @IBAction func swiftUITapFunction()  {

        // MARK: - make this as extention

        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SwiftUICalculatorViewController") as! SwiftUICalculatorViewController
        self.present(viewController, animated: false, completion: nil)

    }

    @IBAction func uiKitTapFunction()  {

        // MARK: - make this as extention

        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UIKitViewController") as! UIKitViewController
        self.present(viewController, animated: false, completion: nil)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
