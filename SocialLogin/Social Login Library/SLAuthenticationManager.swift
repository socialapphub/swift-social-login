//
//  SLAuthenticationManager.swift
//  SocialLogin
//
//  Created by Paolo Musolino on 15/01/16.
//  Copyright © 2016 IQUII. All rights reserved.
//

import UIKit

class SLAuthenticationManager: NSObject {

    static let sharedInstance = SLAuthenticationManager() //singleton
    
    override init() {
        
    }
    
    // MARK: Init methods social
    func initFacebook(){
    
    }
    
    func initTwitter(){
        
    }
    
    func initNativeLogin(){
        
    }
    
    func initNativeRegistration(){
        
    }
    
    // MARK: Facebook methods
    func setFBReadPermission(permission:NSArray){
        
    }
    
    func loginWithFacebook(){
        
    }
    
    func logoutFromFacebook(){
        
    }
    
    // MARK: Twitter methods
    func twitterButtonPressed(){
        
    }
    
    func logoutFromTwitter(){
        
    }
    
    // MARK: Native Login Methods
    func actionNativeLoginButton(){
        
    }
    
    func nativeLogin(email:NSString, password:NSString){
        
    }
    
    // MARK: Native Registration Methods
    func actionNativeRegistrationButton(){
        
    }
    
    func nativeRegistration(email:NSString, password:NSString, name:NSString, username:NSString){
        
    }
}
