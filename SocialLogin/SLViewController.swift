//
//  SLViewController.swift
//  SocialLogin
//
//  Created by Paolo Musolino on 15/01/16.
//  Copyright © 2016 IQUII. All rights reserved.
//

import UIKit
import FacebookSDK
import FBSDKCoreKit
import FBSDKLoginKit
import TwitterKit
import Fabric

class SLViewController: UIViewController, SLDelegate {
    
    @IBOutlet weak var fbLoginButton: UIButton!
    @IBOutlet weak var twitterLoginButton: UIButton!
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    let authenticationManager: SLAuthenticationManager = SLAuthenticationManager.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.authenticationManager.delegate = self
        self.authenticationManager.setFbReadPermission(["public_profile",  "email"])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Buttons Action
    
    @IBAction func facebook(sender: AnyObject) {
        self.authenticationManager.loginWithFacebook()
    }
    @IBAction func twitter(sender: AnyObject) {
    }
    @IBAction func email(sender: AnyObject) {
    }
    @IBAction func signup(sender: AnyObject) {
    }
    
    
    
    //MARK: Authentication Manager Delegate
    
    //Facebook Delegates
    func fbLoggedInUser(loginResult:FBSDKLoginManagerLoginResult){
        print("login fb")
    }
    
    func fbLoggedOutUser(){
        print("logout fb")
    }
    
    func fbLoginViewError(loginResult:FBSDKLoginManagerLoginResult, error:NSError){
        print("errore fb")
    }
    
    //Twitter Delegates
    func twitterLoginButtonPressed(){
        
    }
    
    func twitterLoggedInUser(session:TWTRSession){
        
    }
    
    func twitterHandleError(error:NSError){
        
    }
    
    func twitterLoggedOutUser(){
        
    }
    
    //Native Login Delegates
    func tapOnNativeLoginButton(){
        
    }
    
    func requestOfNativeLoginWithEmail(email:String, password:String){
        
    }
    
    //Native Registration Delegates
    func tapOnNativeRegistrationButton(){
        
    }
    
    func requestOfNativeRegistrationWithEmail(email:String, password:String, name:String, surname:String){
        
    }
    
}

