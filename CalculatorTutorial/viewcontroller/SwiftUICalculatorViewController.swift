//
//  SwiftUICalculatorViewController.swift
//  CalculatorTutorial
//
//  Created by Macbookbro on 10/19/21.
//

import UIKit
import SwiftUI

class SwiftUICalculatorViewController: UIViewController {

    @IBOutlet weak var theContainer : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // MARK: - make extention for adding swiftUI view with some rules and it should be written on the function

        let child = UIHostingController(rootView: CalculatorSwiftUIView())
        addChild(child)
        child.view.frame = theContainer.bounds

        theContainer.addSubview(child.view)

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
