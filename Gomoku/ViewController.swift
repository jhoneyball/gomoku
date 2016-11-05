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
        var board = Board()
        try! board.place(intersection: Intersection(10,10), player: Player.Black)
        try! board.place(intersection: Intersection(11,11), player: Player.White)
        try! board.place(intersection: Intersection(5,10), player: Player.Black)
        try! board.place(intersection: Intersection(11,5), player: Player.White)
        try! board.place(intersection: Intersection(12,5), player: Player.Black)
        try! board.place(intersection: Intersection(6,10), player: Player.White)
        let gridView = GridView(frame: CGRect(x: 0, y: 75, width: self.view.frame.size.width, height: self.view.frame.size.width),board: board)
        self.view.addSubview(gridView)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

