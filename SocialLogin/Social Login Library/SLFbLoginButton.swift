//
//  SLFbLoginButton.swift
//  SocialLogin
//
//  Created by Paolo Musolino on 15/01/16.
//  Copyright © 2016 IQUII. All rights reserved.
//

import UIKit

class SLFbLoginButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addActionLogin()
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addActionLogin()
    }
    
    func addActionLogin(){
        self .addTarget(self, action: Selector(login()), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func login(){
        //TODO: da sistemare
       // SLAuthenticationManager.manager.loginWithFacebook();
    }
}
