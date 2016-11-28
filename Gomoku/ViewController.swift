//
//  ViewController.swift
//  Gomoku
//
//  Created by James Honeyball on 15/10/2016.
//  Copyright © 2016 Honeyball. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gamePresenter: GamePresenter!
    var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        let board = Board(columns: 19, rows: 19)
        let gridFrame = CGRect(x: 0, y: 75, width: self.view.frame.size.width, height: self.view.frame.size.width)
        let gamePresenter = GamePresenter(board: board, frame: gridFrame)
        let gridView = GridView(frame: gridFrame, board: board, gamePresenter: gamePresenter)
        self.view.addSubview(gridView)

        let statusLabel = UILabel(frame: CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        self.view.addSubview(statusLabel)
        statusLabel.text = gamePresenter.status()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

