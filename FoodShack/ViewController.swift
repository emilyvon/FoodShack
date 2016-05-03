//
//  ViewController.swift
//  FoodShack
//
//  Created by Mengying Feng on 1/04/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let burgerBtn = UIButton()
    let pizzaBtn = UIButton()
    let sandwichBtn = UIButton()
    let tacoBtn = UIButton()
    let orderNowBtn = UIButton()
    let selectedItemThumbImg = UIImageView(image: UIImage(named: "burger"))
    let topViewHolder = UIView()
    let mainThumbViewHolder = UIView()
    let buttonViewHolder = UIView()
    let bottomViewHolder = UIView()
    let topThumbBtn = UIButton()
    let topTitleLbl = UILabel()
    
    var views = Dictionary<String, AnyObject>()
    var constraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Appearance
        topViewHolder.backgroundColor = UIColor.whiteColor()
        mainThumbViewHolder.backgroundColor = UIColor(red: 220/255, green: 224/255, blue: 210/255, alpha: 1.0)
        buttonViewHolder.backgroundColor = UIColor(red: 242/255, green: 241/255, blue: 239/255, alpha: 1.0)
        bottomViewHolder.backgroundColor = UIColor(red: 39/255, green: 61/255, blue: 72/255, alpha: 1.0)
        topThumbBtn.setImage(UIImage(named: "burger"), forState: .Normal)
        topTitleLbl.text = "FOOD SHACK"
        topTitleLbl.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
        topTitleLbl.textColor = UIColor(red: 39/255, green: 61/255, blue: 72/255, alpha: 1.0)
        burgerBtn.setImage(UIImage(named: "burger"), forState: .Normal)
        pizzaBtn.setImage(UIImage(named: "pizza"), forState: .Normal)
        sandwichBtn.setImage(UIImage(named: "sandwich"), forState: .Normal)
        tacoBtn.setImage(UIImage(named: "taco"), forState: .Normal)
        orderNowBtn.setTitle("ORDER NOW", forState: .Normal)
        orderNowBtn.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
        orderNowBtn.layer.cornerRadius = 2.0
        orderNowBtn.setTitleColor(UIColor(red: 39/255, green: 61/255, blue: 72/255, alpha: 1.0), forState: .Normal)
        orderNowBtn.backgroundColor = UIColor(red: 250/255, green: 214/255, blue: 78/255, alpha: 1.0)
        
        
        // we not using storyboard constraints, set topViewHolder.translatesAutoresizingMaskIntoConstraints to false
//        topViewHolder.translatesAutoresizingMaskIntoConstraints = false
//        mainThumbViewHolder.translatesAutoresizingMaskIntoConstraints = false
//        buttonViewHolder.translatesAutoresizingMaskIntoConstraints = false
//        bottomViewHolder.translatesAutoresizingMaskIntoConstraints = false
//        topThumbBtn.translatesAutoresizingMaskIntoConstraints = false
//        topTitleLbl.translatesAutoresizingMaskIntoConstraints = false
//        selectedItemThumbImg.translatesAutoresizingMaskIntoConstraints = false
//        burgerBtn.translatesAutoresizingMaskIntoConstraints = false
//        pizzaBtn.translatesAutoresizingMaskIntoConstraints = false
//        sandwichBtn.translatesAutoresizingMaskIntoConstraints = false
//        tacoBtn.translatesAutoresizingMaskIntoConstraints = false
        
        // reformat code
        var elementArray = [UIView]()
        elementArray += [topViewHolder, mainThumbViewHolder, buttonViewHolder, bottomViewHolder, topThumbBtn, topTitleLbl, selectedItemThumbImg, burgerBtn, pizzaBtn, sandwichBtn, tacoBtn, orderNowBtn]
        
        for x in 0..<elementArray.count {
            elementArray[x].translatesAutoresizingMaskIntoConstraints = false
        }
        
        // add subviews
        view.addSubview(topViewHolder)
        view.addSubview(mainThumbViewHolder)
        view.addSubview(buttonViewHolder)
        view.addSubview(bottomViewHolder)
        topViewHolder.addSubview(topThumbBtn)
        topViewHolder.addSubview(topTitleLbl)
        mainThumbViewHolder.addSubview(selectedItemThumbImg)
        buttonViewHolder.addSubview(burgerBtn)
        buttonViewHolder.addSubview(pizzaBtn)
        buttonViewHolder.addSubview(sandwichBtn)
        buttonViewHolder.addSubview(tacoBtn)
        bottomViewHolder.addSubview(orderNowBtn)

        // elements & aliases whose constraints need to be set
        views["topViewHolder"] = topViewHolder
        views["mainThumbViewHolder"] = mainThumbViewHolder
        views["buttonViewHolder"] = buttonViewHolder
        views["bottomViewHolder"] = bottomViewHolder
        views["topThumbBtn"] = topThumbBtn
        views["topTitleLbl"] = topTitleLbl
        views["selectedItemThumbImg"] = selectedItemThumbImg
        views["burgerBtn"] = burgerBtn
        views["pizzaBtn"] = pizzaBtn
        views["sandwichBtn"] = sandwichBtn
        views["tacoBtn"] = tacoBtn
        views["orderNowBtn"] = orderNowBtn
        
        setConstraints()
    }

    
    func setConstraints() {
        
        /** to get rid of warnings, set the priority **/
        
        
//        var formatString = "V:|-[topViewHolder(50)]" 
//        var newConstraints = NSLayoutConstraint.constraintsWithVisualFormat(formatString, options: [], metrics: nil, views: views)
//        constraints += newConstraints

//        formatString = "H:|-0-[topViewHolder]-0-|" // pin leading & trailing edges (default value is 20)
//        newConstraints = NSLayoutConstraint.constraintsWithVisualFormat(formatString, options: [], metrics: nil, views: views)
//        constraints += newConstraints
        
        // reformat above code
        
        /** topViewHolder **/
        addConstraint("V:|-[topViewHolder(70)]-0-[mainThumbViewHolder]")
        addConstraint("H:|-0-[topViewHolder]-0-|")
        
        /** mainThumbViewHolder **/
        addConstraint("V:[mainThumbViewHolder(<=250@250)]-0-[buttonViewHolder]") // with lowest priority 250
        addConstraint("V:[mainThumbViewHolder(>=150@250)]") // with lowest priority 250
        addConstraint("H:|-0-[mainThumbViewHolder(==topViewHolder)]-0-|")
        
        /** buttonViewHolder **/
        addConstraint("V:[buttonViewHolder(<=200)]-0-[bottomViewHolder]")
        addConstraint("V:[buttonViewHolder(>=100)]")
        addConstraint("H:|-0-[buttonViewHolder(mainThumbViewHolder)]-0-|")
        
        /** bottomViewHolder **/
        addConstraint("V:[bottomViewHolder(55@1000)]-|") // with required priority 1000, meaning you can't change it
        addConstraint("H:|-0-[bottomViewHolder(buttonViewHolder)]-0-|")
        
        
        /*** elements in topViewHolder ***/
        /** topThumbBtn **/
        addConstraint("V:|-30-[topThumbBtn(30)]")
        addConstraint("H:|-5-[topThumbBtn(40)]-10-[topTitleLbl]")
        /** topTitleLbl **/
        addConstraint("V:|-30-[topTitleLbl(35)]")
        addConstraint("H:[topTitleLbl(>=50)]")
        
        /*** elements in mainThumbViewHolder ***/
        /** selectedItemThumbImg **/
        addConstraint("V:|-80-[selectedItemThumbImg]-80-|")
        addConstraint("H:|-80-[selectedItemThumbImg]-80-|")
        
        /*** elements in buttonViewHolder ***/
        /** burgerBtn **/
        addConstraint("V:|-20-[burgerBtn(60)]-20-[pizzaBtn]")
        addConstraint("H:|-40-[burgerBtn(60)]")
        
        /** pizzaBtn **/
        addConstraint("V:[pizzaBtn(60)]-20-|")
        addConstraint("H:|-40-[pizzaBtn(60)]")
        
        /** sandwichBtn **/
        addConstraint("V:|-20-[sandwichBtn(60)]-20-[tacoBtn]")
        addConstraint("H:[sandwichBtn(60)]-40-|")
        
        /** tacoBtn **/
        addConstraint("V:[tacoBtn(60)]-20-|")
        addConstraint("H:[tacoBtn(60)]-40-|")
        
        /*** elements in bottomViewHolder ***/
        /** orderNowBtn **/
        addConstraint("V:|-10-[orderNowBtn]-10-|")
        addConstraint("H:[orderNowBtn(180)]-10-|")
        
        
        
        // add all the constraints
        NSLayoutConstraint.activateConstraints(constraints)
    }

    // reformat code
    func addConstraint(format: String) {
        let newConstraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: views)
        constraints += newConstraints
    }


}

