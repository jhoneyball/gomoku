//
//  ViewController.swift
//  Gomoku
//
//  Created by James Honeyball on 15/10/2016.
//  Copyright © 2016 Honeyball. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        let board = Board(columns: 19, rows: 19)
        
        let gridView = GridView(frame: CGRect(x: 0, y: 75, width: self.view.frame.size.width, height: self.view.frame.size.width), board: board)
        self.view.addSubview(gridView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

