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
    
    //MARK: - Table View DataSource
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
    
    
    //MARK: - Table View Delegate
    //Set table view row 行缩进
    /*
    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        
        return indexPath.row % 4
    }
    */
    
    //处理用户行选择
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        if indexPath.row == 0
        {
            return nil
        }
        else
        {
            return indexPath
        }
    }
    
    //在某一行被选中之后调用，通常在这个委托方法，对选择的行进行实际处理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let alert = UIAlertController(title: "Row Selected", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Yes, I Did", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }


}

