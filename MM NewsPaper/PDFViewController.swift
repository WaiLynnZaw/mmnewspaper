//
//  PDFViewController.swift
//  MM NewsPaper
//
//  Created by WaiLynnZaw on 8/9/18.
//  Copyright © 2018 wailynnzaw. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {

    @IBOutlet var pdfView: PDFView!
    var pdfURL: URL!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pdfDocument = PDFDocument(url: pdfURL) {
            pdfView.displayMode = .singlePageContinuous
            pdfView.autoScales = true
            pdfView.displayDirection = .vertical
            pdfView.document = pdfDocument
        }
    }

}
