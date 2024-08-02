//
//  MenuViewController.swift
//  myRoutine
//
//  Created by Milton on 7/31/24.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var btnSAlud: UIButton!
    @IBOutlet weak var btnAccount: UIButton!
    @IBOutlet weak var btnPredeterminados: UIButton!
    
    @IBOutlet weak var btnRutinas: UIButton!
    @IBOutlet weak var btnPersonalizados: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
    }
    

    @IBAction func actionbtnAccount(_ sender: Any) {
        let perfilVC = storyboard?.instantiateViewController(withIdentifier: "perfilVC") as! PerfilViewController
        present(perfilVC, animated: true)   
    }
    
    @IBAction func actionBtnSalud(_ sender: Any) {
        let saludVC = storyboard?.instantiateViewController(withIdentifier: "saludVC") as! SaludViewController
        present(saludVC, animated: true)       }
    
    
    @IBAction func actionBtnPred(_ sender: Any) {
 
        let predeterminadosVC = storyboard?.instantiateViewController(withIdentifier: "predeterminadosVC") as! PredeterminadosViewController
            present(predeterminadosVC, animated: true)    
    }
    
    @IBAction func actionBtnPerso(_ sender: Any) {
        
        let personalizadosVC = storyboard?.instantiateViewController(withIdentifier: "personalizadosVC") as! PersonalizadosViewController
            present(personalizadosVC, animated: true)
    }
    
    @IBAction func actionBtnRutinas(_ sender: Any) {
        let rutinasVC = storyboard?.instantiateViewController(withIdentifier: "rutinasVC") as! RutinasViewController
            present(rutinasVC, animated: true)    }
    
}
