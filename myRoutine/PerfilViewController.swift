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
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        fetchUserData()
        // Do any additional setup after loading the view.
    }
    
    private func fetchUserData() {
        let urlString = "https://eoi8bzbw9a4ibs2.m.pipedream.net/"
        guard let url = URL(string: urlString) else {
            print("URL Invalida")
            return
        }
   
               var request = URLRequest(url: url)
               request.httpMethod = "GET"

             
               let task = URLSession.shared.dataTask(with: request) { data, response, error in
                   if let error = error {
                       print("Error: \(error.localizedDescription)")
                       return
                   }
                   
                   guard let data = data else {
                       print("No se recibieron datos")
                       return
                   }
                   
                   do {
                       
                       if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                          
                           let user = jsonResponse["user"] as? String ?? ""
                           let password = jsonResponse["password"] as? String ?? ""
                           let phone = jsonResponse["telefono"] as? String ?? ""
                           let email = jsonResponse["correo"] as? String ?? ""

 
                           DispatchQueue.main.async {
                               self.txtUser.text = user
                               self.txtPassword.text = password
                               self.txtPhone.text = phone
                               self.txtEmail.text = email
                           }
                       }
                   } catch {
                       print("Error en la extraccion del JSON: \(error.localizedDescription)")
                   }
               }
               
               task.resume()
           }
        
    @IBAction func actionBtnModify(_ sender: Any) {
    }
}
