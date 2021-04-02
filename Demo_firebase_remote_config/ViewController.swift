//
//  ViewController.swift
//  Demo_firebase_remote_config
//
//  Created by Anh vũ on 1/21/21.
//

import UIKit
import FirebaseRemoteConfig

class ViewController: UIViewController {
    
    @IBOutlet weak var displayName: UILabel!
    var remoteConfig: RemoteConfig!
    let welcome_key = "com_demo_config"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
//                remoteConfig.setDefaults(fromPlist: "com_demo_config")
        setupRemoteDefaultValues()
        fetchConfig()
    }
    
    func setupRemoteDefaultValues() {
        let defaults = [
            welcome_key : "This is default" as NSObject
        ]
        remoteConfig.setDefaults(defaults)
    }
    
    
    func fetchConfig() {
        //        displayName.text = remoteConfig[welcome_key].stringValue
        remoteConfig.fetch() { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activate() { (changed, error) in
                    print(changed)
                }
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
            self.displayWelcome()
        }
    }
    
    func displayWelcome() {
        // [START get_config_value]
        let welcomeMessage = remoteConfig[welcome_key].stringValue
        // [END get_config_value]
        displayName.text = welcomeMessage
    }
    
}

