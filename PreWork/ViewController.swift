//
//  ViewController.swift
//  PreWork
//
//  Created by Viet Quoc Bui on 12/28/22.
//

import UIKit
import Foundation

let savedSchool: String = "savedSchool"
let savedFirstName: String = "savedFirstName"
let savedLastName: String = "savedLastName"
let savedNumPets: String = "savedNumPets"
let savedYear: String = "savedYear"

let defaults = UserDefaults.standard

class ViewController: UIViewController {
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var schoolTextField: UITextField!
	@IBOutlet weak var yearSegmentedControl: UISegmentedControl!
	
	@IBOutlet weak var numberOfPets: UILabel!
	@IBOutlet weak var petsStepper: UIStepper!
	@IBOutlet weak var morePetsSwitch: UISwitch!
	
	@IBOutlet weak var introduceButton: UIButton!;
	
	
	@IBAction func oneStepper(_ sender: UIStepper) {
		
		numberOfPets.text = "\(Int(sender.value))"
	}
	
	func checkOptional(textField: UITextField?, name: String) -> String? {
		if let checkText = textField?.text , checkText.isEmpty {
			let alertController = UIAlertController(title: "Missing input",
													message: "Missing \(name)", preferredStyle: .alert)
			
			let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
			
			alertController.addAction(okAction)
			present(alertController, animated: true, completion: nil)
			
			return textField?.text
			
		} else {
			return textField?.text
		}
	}
	
	func checkNumPets(labelField: UILabel?, name: String) -> String? {
		if let checkText = labelField?.text , checkText.isEmpty {
			let alertController = UIAlertController(title: "Missing input",
													message: "Missing \(name)", preferredStyle: .alert)
			
			let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
			
			alertController.addAction(okAction)
			present(alertController, animated: true, completion: nil)
			
			return labelField?.text
			
		} else {
			return labelField?.text
		}
		
	}
	
	@IBAction func present(_ sender: UIButton) {
		
		// Let's us chose the title we have selected from the segmented control
		let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex) ?? "First"
		
		let firstName = checkOptional(textField: firstNameTextField, name: "First Name") ?? ""
		
		let lastName = checkOptional(textField: lastNameTextField, name: "Last Name") ?? ""
		
		let school = checkOptional(textField: schoolTextField, name: "School") ?? ""
		
		let numPets = checkNumPets(labelField: numberOfPets, name: "Pets") ?? ""
		
		// Creating a variable of type string, that holds an introduction. The introduction interpolates the values from the text fields provided.
		// Currently we can only present the information in a print statement. However, this lets us verify that our app is printing out what is intended!
		let introduction = "My name is \(firstName) \(lastName) and I attend \(school). I am currently in my \(year) year and I own \(numPets) cats. It is \(morePetsSwitch.isOn) that I want more pets."
		
		
		// Creates the alert where we pass in our message, which our introduction.
		let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
		
		// A way to dismiss the box once it pops up
		let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
		
		// Passing this action to the alert controller so it can be dismissed
		alertController.addAction(action)
		
		present(alertController, animated: true, completion: nil)
		
		defaults.set(firstNameTextField.text, forKey: savedFirstName)
		defaults.set(lastNameTextField.text, forKey: savedLastName)
		defaults.set(schoolTextField.text, forKey: savedSchool)
		defaults.set(numberOfPets.text, forKey: savedNumPets)
		defaults.set(yearSegmentedControl.selectedSegmentIndex, forKey: savedYear)
	}
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		firstNameTextField.text = defaults.string(forKey: savedFirstName)
		lastNameTextField.text = defaults.string(forKey: savedLastName)
		schoolTextField.text = defaults.string(forKey: savedSchool)
		numberOfPets.text = defaults.string(forKey: savedNumPets)
		yearSegmentedControl.selectedSegmentIndex = defaults.integer(forKey: savedYear)
		
		
	}
}



