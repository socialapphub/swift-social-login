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
        self.authenticationManager.loginWithTwitter()
    }
    
    
    
    //MARK: Authentication Manager Delegate
    
    //Facebook Delegates
    func fbLoggedInUser(loginResult:FBSDKLoginManagerLoginResult){
        print("login fb")
    }
    
    func fbLoggedOutUser(){
        print("logout fb")
    }
    
    func fbLoginViewError(loginResult:FBSDKLoginManagerLoginResult?, error:NSError?){
        print("error fb")
    }
    
    //Twitter Delegates
    func twitterLoggedInUser(session:TWTRSession){
        print("login twitter")
    }
    
    func twitterHandleError(error:NSError){
        print("error twitter")
    }
    
    func twitterLoggedOutUser(){
        print("logout twitter")
    }
    
}

