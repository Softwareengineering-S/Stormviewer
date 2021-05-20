//
//  ViewController.swift
//  Project1
//
//  Created by Monique Shaqiri on 09.05.21.
//  Copyright © 2021 Monique Shaqiri. All rights reserved.
//

import UIKit
// Viewcontroller Class inherits from the buildin Appleclass UIViewcontroller
class ViewController: UITableViewController {
    // creating an empty array named pictures
    var pictures = [String]()
    
// We override the function viewDidLoad from Apple to customize it like we want
    override func viewDidLoad() {
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        //Tells xcode to call the apples default viewcontroller before mine
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Make a constant to acsess the filemanager from swift
        let fm = FileManager.default
        // set the path equal to the default bundle ressourse path every ios project has
        let path = Bundle.main.resourcePath!
        // force unwrapping the items in the ressourcepath at the path path that we created in the constant
        let items = try! fm.contentsOfDirectory(atPath: path)
        // loop through the items and if they have an nssl prefix append them to the array
        for item in items {
            if item.hasPrefix("nssl") {
                // this a picture to load!
                pictures.append(item)
            }
        }
        print(pictures)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
}
}
