//
//  LoginViewController.swift
//  Login
//
//  Created by Paige Plander on 4/5/17.
//  Copyright © 2017 Paige Plander. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Constants used in the LoginViewController
    struct Constants {
        static let backgroundColor: UIColor = UIColor(hue: 0.5389, saturation: 1, brightness: 0.92, alpha: 1.0)
        static let invalidEmailTitle = "Invalid username or password"
        static let invalidEmailMessage = "Please try again"
    }

    // TODO: instantiate the views needed for your project
    var label = UILabel()
    var loginView = UIView()
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    var loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        
        // TODO: Add your views either as subviews of `view` or subviews of each other using `addSubview`
        
        label = UILabel(frame:CGRect(x: 0,
                                     y: 0,
                                     width: UIScreen.main.bounds.width,
                                     height: 300))
        label.text = "Login View Controller"
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont(name: "Avenir", size: 50)
        label.textAlignment = .center
        
        view.addSubview(label)
        
        loginView = UIView(frame:CGRect(x: 0,
                                        y: 0,
                                        width: UIScreen.main.bounds.width * 0.9,
                                        height: 120))
        loginView.backgroundColor = .white
        loginView.center = view.center
        loginView.layer.cornerRadius = 10
        loginView.layer.masksToBounds = true
        view.addSubview(loginView)
        // TODO: layout your views using frames or AutoLayout
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = Constants.backgroundColor
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Avenir", size: 15)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.center = loginView.center
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        loginView.addSubview(loginButton)
        usernameTextField.placeholder = "@berkeley.edu account"
        passwordTextField.placeholder = "Password"
        loginView.addSubview(usernameTextField)
        loginView.addSubview(passwordTextField)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        let myConstraints = [loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 70),
                              loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -70),
                              loginButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
                              loginButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -8),
                              usernameTextField.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
                              passwordTextField.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
                              usernameTextField.heightAnchor.constraint(equalToConstant: 25),
                              passwordTextField.heightAnchor.constraint(equalToConstant: 25),
                              usernameTextField.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 8),
                              passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 8),
                              usernameTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 8),
                              passwordTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 8),
                              loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8)]
        NSLayoutConstraint.activate(myConstraints)
        
    }
    
    // TODO: create an IBAction for your login button
    @IBAction func afterLogin(sender: UIButton) {
        
    }
    
    
    
    
    /// YOU DO NOT NEED TO MODIFY ANY OF THE CODE BELOW (but you will want to use `authenticateUser` at some point)
    
    // Model class to handle checking if username/password combinations are valid.
    // Usernames and passwords can be found in the Lab6Names.csv file
    let loginModel = LoginModel(filename: "Lab6Names")

    /// Imageview for login success image (do not need to modify)
    let loginSuccessView = UIImageView(image: UIImage(named: "oski"))
    
    /// If the provided username/password combination is valid, displays an
    /// image (in the "loginSuccessView" imageview). If invalid, displays an alert
    /// telling the user that the login was unsucessful.
    /// You do not need to edit this function, but you will want to use it for the lab.
    ///
    /// - Parameters:
    ///   - username: the user's berkeley.edu address
    ///   - password: the user's first name (what a great password!)
    func authenticateUser(username: String?, password: String?) {
        
        // if username / password combination is invalid, present an alert
        if !loginModel.authenticate(username: username, password: password) {
            loginSuccessView.isHidden = true
            let alert = UIAlertController(title: Constants.invalidEmailTitle, message: Constants.invalidEmailMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        // If username / password combination is valid, display success image
        else {
            if !loginSuccessView.isDescendant(of: view) {
                view.addSubview(loginSuccessView)
                loginSuccessView.contentMode = .scaleAspectFill
            }
            
            loginSuccessView.isHidden = false
            
            // Constraints for the login success view
            loginSuccessView.translatesAutoresizingMaskIntoConstraints = false
            loginSuccessView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loginSuccessView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            loginSuccessView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            loginSuccessView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        }
    }
}
