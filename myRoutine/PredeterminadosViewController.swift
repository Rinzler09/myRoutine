//
//  PredeterminadosViewController.swift
//  myRoutine
//
//  Created by Milton on 8/1/24.
//

import UIKit

class PredeterminadosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func actionAbdominales(_ sender: Any) {
        
        enviarBD(tipoRutina: "Rutina de Abdominales")

    }
    
    @IBAction func guiaAbdominales(_ sender: Any) {
        if let url = URL(string: "https://www.entrenamientos.com/entrenamientos/abdominales-nivel-medio/8795") {
                   UIApplication.shared.open(url)
               }
    }
    
    @IBAction func guiaBotellas(_ sender: Any) {
        if let url = URL(string: "https://www.entrenamientos.com/entrenamientos/entrenamiento-con-botellas-de-agua/120473"){
                   UIApplication.shared.open(url)
               }
    }
    
    @IBAction func guiaYoga(_ sender: Any) {
        if let url = URL(string: "https://www.entrenamientos.com/entrenamientos/yoga-posturas-basicas/137856") {
                   UIApplication.shared.open(url)
               }
    }
    
    @IBAction func actionBotellas(_ sender: Any) {
        enviarBD(tipoRutina: "Rutina Botellas de Agua")
    }
    
    @IBAction func actionYoga(_ sender: Any) {
        enviarBD(tipoRutina: "Rutina Yoga Basica")
    }
    
        func enviarBD(tipoRutina: String){
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            let fecha = dateFormatter.string(from: currentDate)
        
        let tipoR = tipoRutina
        
        let parameters: [String: Any] = [
            "id_predeterminada": 0,
            "nombre": tipoR,
            "fecha": fecha
        ]
        guard let url = URL(string: "https://eogyh8vq0u56682.m.pipedream.net") else {
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
    }
}

  
