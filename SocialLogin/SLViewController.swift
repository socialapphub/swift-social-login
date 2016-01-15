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

class ViewController: UIViewController, SLDelegate {

    var authenticationManager:SLAuthenticationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // self.authenticationManager.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        //Facebook Delegates
    func fbLoggedInUser(loginResult:FBSDKLoginManagerLoginResult){
        
    }
    
    func fbLoggedOutUser(){
        
    }
    
    func fbLoginViewError(loginResult:FBSDKLoginManagerLoginResult, error:NSError){
        
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

