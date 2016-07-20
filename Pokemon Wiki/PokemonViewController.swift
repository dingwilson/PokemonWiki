//
//  PokemonViewController.swift
//  Pokemon Wiki
//
//  Created by Wilson Ding on 7/19/16.
//  Copyright © 2016 Wilson Ding. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var pokemonData = [String]()
    
    var selectedNumber = 0
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    var pokemonSearchResults:Array<String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        getData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
        // Gets Pokemon Data from Pokemon.txt
        
        if let path = NSBundle.mainBundle().pathForResource("Pokemon", ofType: "plist"){
            if let arrayOfDictionaries = NSArray(contentsOfFile: path){
                for dict in arrayOfDictionaries {
                    pokemonData.append(dict.objectForKey("Name") as! String)
                }
            }
        }
        self.pokemonTableView.reloadData()
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return pokemonData.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel!.text = pokemonData[indexPath.row]
        cell.detailTextLabel!.text = String(format: "%03d", indexPath.row  + 1)
        cell.imageView!.image = UIImage(named: String(pokemonData[indexPath.row]).lowercaseString)

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedNumber = indexPath.row + 1
        self.performSegueWithIdentifier("showPokemon", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let navigationController = segue.destinationViewController as! UINavigationController
        let targetController = navigationController.topViewController as! ShowPokemonViewController
        
        targetController.selectedNumber = selectedNumber
    }

}
