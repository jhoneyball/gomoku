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
        let board = Board(columns: 10, rows: 10)
        try! board.place(intersection: Intersection(1,1), player: Player.Black)
        try! board.place(intersection: Intersection(0,0), player: Player.White)
//        try! board.place(intersection: Intersection(11,11), player: Player.White)
//        try! board.place(intersection: Intersection(5,10), player: Player.Black)
//        try! board.place(intersection: Intersection(11,5), player: Player.White)
//        try! board.place(intersection: Intersection(12,5), player: Player.Black)
//        try! board.place(intersection: Intersection(18,18), player: Player.White)

        let gridView = GridView(frame: CGRect(x: 0, y: 75, width: self.view.frame.size.width, height: self.view.frame.size.width), board: board)
        self.view.addSubview(gridView)
        statusLabel = UILabel(frame: CGRect(x: 0.0, y: 20.0, width: self.view.frame.size.width, height: 25.0))
        statusLabel.textColor = UIColor.white
        statusLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(statusLabel)
        statusLabel.text = gamePresenter.statusLabelText()
        
    }
    
 func didTapped () {
        statusLabel.text = gamePresenter.statusLabelText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

