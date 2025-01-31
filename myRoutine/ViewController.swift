//
//  ViewController.swift
//  myRoutine
//
//  Created by Milton on 7/30/24.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
        
    }

    @IBAction func actionContinue(_ sender: Any) {
        let menuVC = storyboard?.instantiateViewController(withIdentifier: "menuVC") as! MenuViewController
        present(menuVC, animated: true)
        
       
    }
    
    
    @IBAction func actionAccount(_ sender: Any) {
        let cuentaVC = storyboard?.instantiateViewController(withIdentifier: "cuentaVC") as! CuentaViewController
        present(cuentaVC, animated: true)
    }
    

}

