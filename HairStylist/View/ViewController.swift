//
//  ViewController.swift
//  HairStylist
//
//  Created by Stephen Byron on 2/26/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var maybeleneTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageInfo()
        logInButtonInfo()
        passwordTextFieldInfo()
        userNameTextFieldInfo()
        
    }


    @IBAction func loginButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let productsList = storyBoard.instantiateViewController(withIdentifier: "ProductsListViewController") as! ProductsListViewController
      self.navigationController?.pushViewController(productsList, animated: true)
        print("Show List View")
    }
    
    func imageInfo() {
        
        logoImage.image = UIImage(named: "lady")
        
        logoImage.contentMode = .scaleAspectFill
        
        logoImage.layer.cornerRadius = logoImage.frame.size.width / 2
        logoImage.layer.cornerRadius = 15
        logoImage.layer.shadowColor = UIColor.gray.cgColor // set the shadow color
        logoImage.layer.shadowOpacity = 3.9 // set the shadow opacity
        logoImage.layer.shadowOffset = CGSize(width: 0, height: 0) // set the shadow offset
        logoImage.layer.shadowRadius = 3 // set the shadow radius
    }
    
    func logInButtonInfo() {
        
        loginButton.layer.cornerRadius = 3
        loginButton.layer.shadowColor = UIColor.gray.cgColor // set the shadow color
        loginButton.layer.shadowOpacity = 3.9 // set the shadow opacity
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 0) // set the shadow offset
        loginButton.layer.shadowRadius = 3 // set the shadow radius
        
    }
    
    func passwordTextFieldInfo() {
        
        //MARK: Set the placeholder text and color of the UITextField
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.tertiarySystemGroupedBackground])
        
        passwordTextfield.layer.shadowColor = UIColor.gray.cgColor // set the shadow color
        passwordTextfield.layer.shadowOpacity = 5.0 // set the shadow opacity
        passwordTextfield.layer.shadowOffset = CGSize(width: 0, height: 0) // set the shadow offset
        passwordTextfield.layer.shadowRadius = 3 // set the shadow radius
        
    }
    
    func userNameTextFieldInfo() {
        
        //MARK: Set the placeholder text and color of the UITextField
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.tertiarySystemGroupedBackground])
        
        emailTextfield.layer.shadowColor = UIColor.gray.cgColor // set the shadow color
        emailTextfield.layer.shadowOpacity = 3.9 // set the shadow opacity
        emailTextfield.layer.shadowOffset = CGSize(width: 0, height: 0) // set the shadow offset
        emailTextfield.layer.shadowRadius = 3 // set the shadow radius
        
    }
    
}

