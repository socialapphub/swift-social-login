//
//  SLAuthenticationManager.swift
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

protocol SLDelegate:class{
    
    //Facebook Delegates
    func fbLoggedInUser(loginResult:FBSDKLoginManagerLoginResult)
    func fbLoggedOutUser()
    func fbLoginViewError(loginResult:FBSDKLoginManagerLoginResult, error:NSError)
    
    //Twitter Delegates
    func twitterLoginButtonPressed()
    func twitterLoggedInUser(session:TWTRSession)
    func twitterHandleError(error:NSError)
    func twitterLoggedOutUser()
    
    //Native Login Delegates
    func tapOnNativeLoginButton()
    func requestOfNativeLoginWithEmail(email:String, password:String)
    
    //Native Registration Delegates
    func tapOnNativeRegistrationButton()
    func requestOfNativeRegistrationWithEmail(email:String, password:String, name:String, surname:String)
}

class SLAuthenticationManager: NSObject {
    
    var delegate:SLDelegate? //variabile delegato
    
    //singleton
    static let sharedInstance = SLAuthenticationManager()
    
    //Facebook
    var fbLoginManager : FBSDKLoginManager! //facebook login manager
    var readPermissions : NSMutableArray! //facebook read permission
    
    override init() {
        super.init()
        initFacebook()
//        initTwitter()
//        initNativeLogin()
//        initNativeRegistration()
    }
    
    // MARK: Init private methods social
    private func initFacebook(){
        self.fbLoginManager = FBSDKLoginManager.init()
        self.readPermissions = NSMutableArray()
    }
    
    private func initTwitter(){
        //se c'è già un utente loggato, allora configura twitter usando Fabric
        if Twitter.sharedInstance().session()?.userName != nil{
            Fabric.with([Twitter.sharedInstance()])
        }
        
        //controlla se un utente è loggato o meno, e ad ogni modo configura Fabric.
        Twitter.sharedInstance().logInWithCompletion { (session, error) -> Void in
            Fabric.with([Twitter.sharedInstance()])
            if session != nil{
                self.delegate?.twitterLoggedInUser(session!)
            }
            else{
                self.delegate?.twitterHandleError(error!)
            }
        }
    }
    
    private func initNativeLogin(){
    }
    
    private func initNativeRegistration(){
    }
    
    // MARK: Facebook methods
    func setFbReadPermission(permission:NSArray){
        self.readPermissions = NSMutableArray.init(array: permission)
    }
    
    func loginWithFacebook(){
        FBSDKProfile.enableUpdatesOnAccessTokenChange(false)
        self.fbLoginManager.logInWithReadPermissions(readPermissions.copy() as! [AnyObject], fromViewController:nil) { (result, error) -> Void in
            if (error != nil) {
                self.delegate?.fbLoginViewError(result, error: error);
            }
            else if result.isCancelled{
                //Cancelled
                self.delegate?.fbLoginViewError(result, error: error);
            }
            else{
                self.delegate?.fbLoggedInUser(result)
            }
            
        }
    }
    
    func logoutFromFacebook(){
        self.fbLoginManager.logOut()
        self.delegate?.fbLoggedOutUser()
    }
    
    // MARK: Twitter methods
    func twitterButtonPressed(){
        
        self.delegate?.twitterLoginButtonPressed()
        
        /**
        *  The completion block to be called with a `TWTRSession` if successful,
        *  and a `NSError` if logging in failed or was canceled.
        */
        Twitter.sharedInstance().logInWithCompletion { (session, error) -> Void in
            Fabric.with([Twitter.sharedInstance()])
            if session != nil{
                self.delegate?.twitterLoggedInUser(session!)
            }
            else{
                self.delegate?.twitterHandleError(error!)
            }
        }
        
    }
    
    func logoutFromTwitter(){
        Twitter.sharedInstance().logOut()
        Twitter.sharedInstance().logOutGuest()
        
        self.delegate?.twitterLoggedOutUser()
    }
    
    // MARK: Native Login Methods
    func actionNativeLoginButton(){
        self.delegate?.tapOnNativeLoginButton()
    }
    
    func nativeLogin(email:String, password:String){
        self.delegate?.requestOfNativeLoginWithEmail(email, password: password)
    }
    
    // MARK: Native Registration Methods
    func actionNativeRegistrationButton(){
        self.delegate?.tapOnNativeRegistrationButton()
    }
    
    func nativeRegistration(email:String, password:String, name:String, username:String){
        self.delegate?.requestOfNativeRegistrationWithEmail(email, password: password, name: name, surname: username)
    }
}
