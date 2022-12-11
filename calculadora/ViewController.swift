//
//  ViewController.swift
//  calculadora
//
//  Created by Alexei Emmanuel Martínez Mendoza on 04/12/22.
//

import UIKit

class ViewController: UIViewController {

    private let ZERO:String = "0"
    
    private var stackOfStrings = [String]()
    
    
    // UILabel para mostrar los números tecleados o el resultado de una operación
    @IBOutlet var capturaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializamos con cero la Pantalla de la calculadora
        capturaLabel.text = self.ZERO
        
        
    }
    
    /// Evento que se dispara cuando el usuario presiona un boton de numeros.
    ///
    /// - Parameter sender: Button que activa el evento y que lee el número asignado o el punto decimal.
    @IBAction func pressNumberButton(_ sender: UIButton) {
        let value = sender.titleLabel?.text
        
        //let numero = Int(value!)
        //let tagValue = sender.tag
        //print(tagValue)
        
        if (self.capturaLabel.text?.first == "0"){
            self.capturaLabel.text = ""
        }
        
        // Validación para solo introducir el punto decimal una vez
        if ((self.capturaLabel.text?.contains(".")) == false && value == "." ){
            self.capturaLabel.text?.append(value ?? "")
        }
        
        // Concatenamos solo numeros
        if (value != "." ){
            self.capturaLabel.text?.append(value ?? "")
        }
        
    }
    
    /// Action que limpia la pantalla y los operadores introducidos por el usuario
    /// - Parameter sender: Botton AC
    @IBAction func clearCapturaLabel(_ sender: UIButton) {
        self.capturaLabel.text = self.ZERO
        self.stackOfStrings.removeAll()
    }
    
    
    /// Action que elimina el ultimo digito introducido por el usuario
    /// - Parameter sender: Botton retroceso
    @IBAction func deleteLastCharacter(_ sender: UIButton) {
        if(self.capturaLabel.text!.count <= 1){
            self.capturaLabel.text = self.ZERO
        } else {
            self.capturaLabel.text = String(self.capturaLabel.text?.dropLast() ?? "0")
        }
    }
}

