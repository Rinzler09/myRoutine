//
//  PerfilViewController.swift
//  myRoutine
//
//  Created by Milton on 8/1/24.
//

import UIKit

class PerfilViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnModify: UIButton!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }

    @IBAction func actionBtnModify(_ sender: Any) {
    }
}
