//
//  SecondViewController.swift
//  MM NewsPaper
//
//  Created by WaiLynnZaw on 8/9/18.
//  Copyright © 2018 wailynnzaw. All rights reserved.
//

import UIKit
import WebKit
class KyayMonController: MyanmarALinController {
    override func getTitle() -> String {
        return "ကြေးမုံ"
    }
    override func getUrl() -> String {
        return "https://www.moi.gov.mm/km/"
    }
}

