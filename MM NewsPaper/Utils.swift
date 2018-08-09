//
//  Utils.swift
//  MM NewsPaper
//
//  Created by WaiLynnZaw on 8/9/18.
//  Copyright © 2018 wailynnzaw. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
class Utils {
    func showProgressHUD(_ view: UIView) {
        let activityData = ActivityData(type: NVActivityIndicatorType.ballPulse)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    func hideProgressHUD(_ view: UIView) {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
}
