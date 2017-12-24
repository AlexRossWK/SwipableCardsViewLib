//
//  ViewController.swift
//  ACSwipableCardsView
//
//  Created by  Alexey Rossoshansky on 10.12.17.
//  Copyright © 2017  Alexey Rossoshansky. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var cardsView: ACSwipablweCardsView!
    
    let kCardNib = UINib(nibName: "View", bundle: nil)
    //Test
    var dataArray = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...9 {
            dataArray.append(i)
        }
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        cardsView.registerNib(nib: kCardNib)
        cardsView.dataSource = self
        cardsView.delegate = self
        
        super.viewWillAppear(animated)
    }
}

//MARK:- Delegate and DataSource
extension ViewController : ACSwipablweCardsViewDelegate, ACSwipablweCardsViewDataSource
{
    
    func numberOfViews() -> Int
    {
        return dataArray.count
    }
    
    func view ( view : UIView , atIndex index : Int )
    {
        let label = view.viewWithTag(1488) as! UILabel
        label.text = "\(dataArray[index])"
        
        if index == dataArray.count - 4 {
        for i in 200...210 {
            dataArray.append(i)
        }
        
        cardsView.reloadData()
        }
    }
    
    func swiped(direction: SwipeDirections, index: Int)
    {
        print("\(index) card was swiped at \(direction)")
    }
    
    func swipesEnded()
    {
        
    }
}

