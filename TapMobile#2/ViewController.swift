//
//  ViewController.swift
//  TapMobile#2
//
//  Created by Elad on 21/02/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let service = YoutubeServiceApi()
        
        let myURLString = "https://youtube.com/results?search_query=messi"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }

        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .utf8)
            print(myHTMLString.youtubeID)
//            print("HTML : \(myHTMLString)")
        } catch let error {
            print("Error: \(error)")
        }
        // Do any additional setup after loading the view.
    }


}

