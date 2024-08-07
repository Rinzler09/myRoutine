//
//  PersonalizadosViewController.swift
//  myRoutine
//
//  Created by Milton on 8/1/24.
//

import UIKit

class PersonalizadosViewController: UIViewController {
    
    @IBOutlet weak var absSeries: UITextField!
    @IBOutlet weak var absRepes: UITextField!
    
    @IBOutlet weak var saltosRepes: UITextField!
    @IBOutlet weak var saltosSeries: UITextField!
    @IBOutlet weak var pechadasRepes: UITextField!
    @IBOutlet weak var pechadasSeries: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
    }
    
    @IBAction func actionCreatePerso(_ sender: Any) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let fecha = dateFormatter.string(from: currentDate)
        
        guard let absSeriesText = absSeries.text, !absSeriesText.isEmpty,
              let absRepesText = absRepes.text, !absRepesText.isEmpty,
              let saltosRepesText = saltosRepes.text, !saltosRepesText.isEmpty,
              let saltosSeriesText = saltosSeries.text, !saltosSeriesText.isEmpty,
              let pechadasRepesText = pechadasRepes.text, !pechadasRepesText.isEmpty,
              let pechadasSeriesText = pechadasSeries.text, !pechadasSeriesText.isEmpty,
              let absSeries = Int(absSeriesText),
              let absRepes = Int(absRepesText),
              let saltosRepes = Int(saltosRepesText),
              let saltosSeries = Int(saltosSeriesText),
              let pechadasRepes = Int(pechadasRepesText),
              let pechadasSeries = Int(pechadasSeriesText) else {
            print("Por favor llene todos los campos requeridos y asegúrese de que sean números enteros")
            return
        }
        
        let parameters: [String: Any] = [
            "abdominales_series": absSeries,
            "abdominales_repeticiones": absRepes,
            "pechadas_series": pechadasSeries,
            "pechadas_repeticiones": pechadasRepes,
            "saltos_series": saltosSeries,
            "saltos_repeticiones": saltosRepes,
            "fecha_personalizada": fecha
            
        ]
        
        guard let url = URL(string: "https://eo9363vz8vm28rn.m.pipedream.net") else {
            print("URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            request.httpBody = jsonData
        } catch {
            print("Error en la serialización del JSON: \(error)")
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
                print("Error en la conversión del JSON: \(error)")
            }
            
        }
        task.resume()
        
        DispatchQueue.main.async {
            self.absSeries.text = ""
            self.absRepes.text = ""
            self.saltosRepes.text = ""
            self.saltosSeries.text = ""
            self.pechadasRepes.text = ""
            self.pechadasSeries.text = ""
        }
        
    }
}
