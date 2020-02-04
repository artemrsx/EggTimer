//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5;
    let mediumTime = 7;
    let hardTime = 12;
    
    let eggTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    
    @IBAction func onEggPress(_ sender: UIButton) {
        var time: Int;
        let title: String = sender.currentTitle!;

        print(eggTimes[title]!);
        
        switch title {
        case "Soft":
            time = 5;
        case "Medium":
            time = 7;
        case "Hard":
            time = 12;
        default:
            time = 0;
        }
        
        print(title, time);
    }
    

}
