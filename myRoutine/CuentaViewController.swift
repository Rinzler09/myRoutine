//
//  CuentaViewController.swift
//  myRoutine
//
//  Created by Milton on 7/30/24.
//

import UIKit

class CuentaViewController: UIViewController {
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnCreate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }

    @IBAction func actionCreate(_ sender: Any) {
        
        guard let user = txtUser.text, !user.isEmpty,
              let password = txtPassword.text, !password.isEmpty,
              let phoneText = txtPhone.text, !phoneText.isEmpty,
              let phone = Int(phoneText),
              let email = txtEmail.text, !email.isEmpty else {
            print("Por favor llene todos los campos requeridos")
            return
        }
        
        let estado: Int = 1
        
        let parameters: [String: Any] = [
            "id_usuario": 0,
            "user": user,
            "password": password,
            "correo": email,
            "telefono": phone,
            "estado": estado
        ]
        guard let url = URL(string: "https://eokt60mq15hwcsa.m.pipedream.net") else {
            return }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json",forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            request.httpBody = jsonData
        } catch {
            print("Error en la serializacion del JSON: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("Respuesta: \(json)")
                                
                }
            } catch {
                print("Eror en la Conversion del JSON: \(error)")
            }
        }
        task.resume()
        
        DispatchQueue.main.async {
            self.txtUser.text = ""
            self.txtPassword.text = ""
            self.txtPhone.text = ""
            self.txtEmail.text = ""
        }
    }
}
