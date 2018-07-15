//
//  ThemeService.swift
//  Chat App
//
//  Created by Ashkhen on 7/3/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import Foundation
import ALLoadingView

class ThemeService {
    
    static func showLoading(_ status: Bool)  {
        if status {
            ALLoadingView.manager.messageText = ""
            ALLoadingView.manager.animationDuration = 1.0
            ALLoadingView.manager.showLoadingView(ofType: .messageWithIndicator)
            
        } else {
            ALLoadingView.manager.hideLoadingView()
        }
    }
}
