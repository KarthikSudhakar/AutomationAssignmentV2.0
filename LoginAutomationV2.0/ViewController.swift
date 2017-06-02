//
//  ViewController.swift
//  LoginAutomationV2.0
//
//  Created by KarthikSudhakar on 6/2/17.
//  Copyright © 2017 KarthikSudhakar. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newWebDriver()
    }
    
    
    //Method to initiate the request
    func newWebDriver()
    {
        
        let url = URL(string: "https://developer.apple.com")!
        let name="\(url)"
        //Use "https://yearinmusic.spotify.com/404" to try with a non available URL"
        
        let request = URLRequest(url: url)
        
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                
                var code=httpResponse.statusCode
                print("statusCode: \(httpResponse.statusCode)")
                
                //response code validation before browser launch
                if code==200
                {
                    self.get(name:name)
                }
                else
                {
                    print("Website Not Available!.Do you want to continue?Press 'y' to continue or any other key to end the app.")
                    let selection=readLine()
                    if selection == "y"
                    {
                        self.get(name:name)
                    }
                    else
                    {
                        self.quit()
                    }
                    // print(selection)
                }
                
            }
            
        }
        task.resume()
        
    }
    
    //Method to launch the site
    func get(name:String)
    {
        if let url = URL(string: name), NSWorkspace.shared().open(url) {
            print("default browser successfully opened")
        }
        
    }
    
    //Method to delete the transaction thread
    func quit()
    {
        self.view.window?.close()
        
    }


    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

