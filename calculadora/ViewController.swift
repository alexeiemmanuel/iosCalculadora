//
//  ViewController.swift
//  calculadora
//
//  Created by Alexei Emmanuel Martínez Mendoza on 04/12/22.
//

import UIKit

class ViewController: UIViewController {

    private var stackOfStrings = [String]()
    
    
    
    @IBOutlet var capturaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    /// Evento que se dispara cuando el usuario presiona un boton de numeros.
    ///
    /// -      Parameter sender: Button que activa el evento y que lee el número asignado.
    @IBAction func pressNumberButton(_ sender: UIButton) {
        let value = sender.titleLabel?.text
        let numero = Int(value!)
        //print(String(value: numero))
        
        // Concatenamos el valor dellabel con el número presionado
        self.capturaLabel.text?.append(value ?? "")
    }
    
    
    @IBAction func clearCapturaLabel(_ sender: UIButton) {
        self.capturaLabel.text = ""
        self.stackOfStrings.removeAll()
    }
    
}

