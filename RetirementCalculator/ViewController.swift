//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Nadeesha Chandrapala on 08/02/2024.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {

    @IBOutlet weak var monthlyInvestmentsTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var retirementAgeTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Oops", message: "Sorry about that, an error occured.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It's cool", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        Analytics.trackEvent("navigated_to_calculator")
    }

    @IBAction func calculateButtonTouchUpInside(_ sender: Any) {
//        Crashes.generateTestCrash()
        let monthlyInvestments: Int = Int(monthlyInvestmentsTextField.text ?? "0") ?? 0
        let currentAge : Int = Int(ageTextField.text ?? "0") ?? 0
        let plannedRetirementAge : Int = Int(retirementAgeTextField.text ?? "0") ?? 0
        let interestRate : Int = Int(interestRateTextField.text ?? "0") ?? 0
        let savings : Int = Int(savingsTextField.text ?? "0") ?? 0
        
        resultLabel.text = "If you save $\(monthlyInvestments) every month for \(plannedRetirementAge - currentAge) years, and invest that money plus your current investment of \(savings) at a \(interestRate) anual interest rate, you will have $x by the time you are \(plannedRetirementAge)"

        let properties = ["current_age": String(currentAge),
                          "planned_retirement_age": String(plannedRetirementAge)]

        Analytics.trackEvent("calculate_retirement_amount", withProperties: properties)
    }
    
}

