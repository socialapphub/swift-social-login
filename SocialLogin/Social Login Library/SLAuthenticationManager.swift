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

@objc protocol SLDelegate:class{
    
    //Facebook Delegates
    optional func fbLoggedInUser(loginResult:FBSDKLoginManagerLoginResult)
    optional func fbLoggedOutUser()
    optional func fbLoginViewError(loginResult:FBSDKLoginManagerLoginResult?, error:NSError?)
    
    //Twitter Delegates
    optional func twitterLoggedInUser(session:TWTRSession)
    optional func twitterHandleError(error:NSError)
    optional func twitterLoggedOutUser()
}

class SLAuthenticationManager: NSObject {
    
    var delegate:SLDelegate? //variabile delegato
    
    //singleton
    static let sharedInstance = SLAuthenticationManager()
    
    //Facebook
    var fbLoginManager : FBSDKLoginManager! //facebook login manager
    var readPermissions : NSMutableArray! //facebook read permission
    
    // MARK: Init
    override init() {
        super.init()
        initFacebook()
        initTwitter()
    }
    
    private func initFacebook(){
        self.fbLoginManager = FBSDKLoginManager.init()
        self.readPermissions = NSMutableArray()
    }
    
    private func initTwitter(){
        Fabric.with([Twitter.self])
    }
    
    
    // MARK: Facebook methods
    func setFbReadPermission(permission:NSArray){
        self.readPermissions = NSMutableArray.init(array: permission)
    }
    
    func loginWithFacebook(){
        FBSDKProfile.enableUpdatesOnAccessTokenChange(false)
        self.fbLoginManager.logInWithReadPermissions(readPermissions.copy() as! [AnyObject], fromViewController:nil) { (result, error) -> Void in
            if (error != nil) {
                self.delegate?.fbLoginViewError?(result, error: error);
            }
            else if result.isCancelled{
                //Cancelled
                self.delegate?.fbLoginViewError?(result, error: error);
            }
            else{
                self.delegate?.fbLoggedInUser?(result)
            }
            
        }
    }
    
    func logoutFromFacebook(){
        self.fbLoginManager.logOut()
        self.delegate?.fbLoggedOutUser?()
    }
    
    // MARK: Twitter methods
    func loginWithTwitter(){
        
        //controlla se un utente è loggato o meno, e ad ogni modo configura Fabric.
        /**
        *  The completion block to be called with a `TWTRSession` if successful,
        *  and a `NSError` if logging in failed or was canceled.
        */
        Twitter.sharedInstance().logInWithCompletion { (session, error) -> Void in
            Fabric.with([Twitter.self])
            if session != nil{
                self.delegate?.twitterLoggedInUser?(session!)
            }
            else{
                self.delegate?.twitterHandleError?(error!)
            }
        }
        
    }
    
    func logoutFromTwitter(){
        Twitter.sharedInstance().logOut()
        Twitter.sharedInstance().logOutGuest()
        
        self.delegate?.twitterLoggedOutUser?()
    }
    
}
