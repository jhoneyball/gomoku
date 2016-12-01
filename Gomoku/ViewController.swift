//
//  ViewController.swift
//  Gomoku
//
//  Created by James Honeyball on 15/10/2016.
//  Copyright © 2016 Honeyball. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var statusLabel: UILabel!
    var gamePresenter: GamePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue

        let gridFrame = CGRect(x: 0, y: 75, width: self.view.frame.size.width, height: self.view.frame.size.width)
        
        gamePresenter = PresentationFactory.makeGamePresenter(frame: gridFrame)
        
        let gridView = GridView(frame: gridFrame, gamePresenter: gamePresenter)

        gridView.tapResponder = {
            self.didTapped()
        }
        
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

