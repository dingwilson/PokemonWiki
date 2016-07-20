//
//  ShowPokemonViewController.swift
//  Pokemon Wiki
//
//  Created by Wilson Ding on 7/19/16.
//  Copyright © 2016 Wilson Ding. All rights reserved.
//

import UIKit

class ShowPokemonViewController: UIViewController {
    
    var selectedNumber = 0

    @IBOutlet weak var number: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getData(selectedNumber)
        
        number.text = "\(selectedNumber)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(number: Int) {
        if let path = NSBundle.mainBundle().pathForResource("Pokemon", ofType: "plist"){
            if let arrayOfDictionaries = NSArray(contentsOfFile: path){
                for dict in arrayOfDictionaries {
                    //pokemonData.append(dict.objectForKey("Name") as! String)
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
