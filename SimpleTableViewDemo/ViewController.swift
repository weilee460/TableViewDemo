//
//  ViewController.swift
//  SimpleTableViewDemo
//
//  Created by ying on 16/3/7.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let dwarves = [
        "Sleepy", "Sneezy", "Bashful", "Happy",
        "Doc", "Grumpy", "Dopey",
        "Thorin", "Dorin", "Nori", "Ori",
        "Balin", "Dwalin", "Fili", "Kili",
        "Oin", "Gloin", "Bifur", "Bofur",
        "Bombur"
    ]
    
    struct ConstansForTableView {
        static let SimpleTableIdentifier = "simpleTableIdentifier"
    }
    
    //MARK: - Table View DataSource Method
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dwarves.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(ConstansForTableView.SimpleTableIdentifier)
        if cell == nil
        {
            //cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ConstansForTableView.SimpleTableIdentifier)
            
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ConstansForTableView.SimpleTableIdentifier)
            
            //cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: ConstansForTableView.SimpleTableIdentifier)
            
            //cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: ConstansForTableView.SimpleTableIdentifier)
        }
        
        //Add image to table view cell
        let image = UIImage(named: "star")
        cell!.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell!.imageView?.highlightedImage = highlightedImage
        
        //set cell detailTextLabel text, but default cell style has no detail label
        if indexPath.row < 7
        {
            cell!.detailTextLabel?.text = "Mr Disney"
        }
        else
        {
            cell!.detailTextLabel?.text = "Mr Tolkien"
        }
        
        //set cell title
        cell!.textLabel?.text = dwarves[indexPath.row]
        
        return cell!
    }


}

