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
        try! board.place(intersection: Intersection(column: 1, row: 1), player: Player.Black)
//        try! board.place(intersection: Intersection(row: 0, column: 0), player: Player.White)
//        try! board.place(intersection: Intersection(row: 11, column: 11), player: Player.White)
//        try! board.place(intersection: Intersection(row: 5, column: 10), player: Player.Black)
//        try! board.place(intersection: Intersection(row: 11, column: 5), player: Player.White)
//        try! board.place(intersection: Intersection(row: 12, column: 5), player: Player.Black)
//        try! board.place(intersection: Intersection(row: 18, column: 18), player: Player.White)

        let gridView = GridView(frame: CGRect(x: 0, y: 75, width: self.view.frame.size.width, height: self.view.frame.size.width), board: board)
        self.view.addSubview(gridView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

