//
//  SaludViewController.swift
//  myRoutine
//
//  Created by Milton on 8/1/24.
//

import UIKit

class SaludViewController: UIViewController {

    @IBOutlet weak var txtAltura: UITextField!
    @IBOutlet weak var txtPeso: UITextField!
    @IBOutlet weak var txtIMC: UITextField!
    @IBOutlet weak var btnCalcular: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        txtIMC.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionBtnCalcular(_ sender: Any) {
        guard let alturaText = txtAltura.text, let pesoText = txtPeso.text else {
            return
        }
        
     
        guard let altura = Double(alturaText), let peso = Double(pesoText) else {
            return
        }
        
  
        let imc = peso / (altura * altura)
        

        txtIMC.text = String(format: "%.2f", imc)
    }
}
    


