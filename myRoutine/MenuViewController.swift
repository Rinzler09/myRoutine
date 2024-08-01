//
//  MenuViewController.swift
//  myRoutine
//
//  Created by Milton on 7/31/24.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var btnSalud: UIButton!
    @IBOutlet weak var btnAccount: UIButton!
    @IBOutlet weak var btnPredeterminados: UIButton!
    @IBOutlet weak var btnRutinas: UIButton!
    @IBOutlet weak var btnPersonalizados: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionbtnAccount(_ sender: Any) {
        let perfilVC = storyboard?.instantiateViewController(withIdentifier: "perfilVC") as! PerfilViewController
        present(perfilVC, animated: true)   
    }
    
    @IBAction func actionBtnSalud(_ sender: Any) {
        let saludVC = storyboard?.instantiateViewController(withIdentifier: "saludVC") as! SaludViewController
        present(saludVC, animated: true)       }
    
}
