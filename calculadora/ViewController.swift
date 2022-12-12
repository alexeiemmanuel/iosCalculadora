//
//  ViewController.swift
//  calculadora
//
//  Created by Alexei Emmanuel Martínez Mendoza on 04/12/22.
//

import UIKit

/// Controlador principal de la aplicación
class ViewController: UIViewController {

    /// Constante que contiene el valor inicial de la pantalla de la calculadora
    private let ZERO:String = "0"
    
    /// Constante que contiene un mensaje
    private let DIVISION_ZERO = "Error división entre cero."
    
    /// Formatedor para los numeros que introduce el usuario
    private let formatterInput : NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 30
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 30
        
        return formatter
    }()
    
    /// Variable que contiene el total de cualquier operación
    private var total:Double = 0
    
    /// Variable que va a contener el estado de la operación que desea el usuario
    private var operacion:EnumOperation = .SIN_OPERACION
    
    // UILabel para mostrar los números tecleados o el resultado de una operación
    @IBOutlet var capturaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializamos con cero la Pantalla de la calculadora
        capturaLabel.text = self.ZERO
        
        
    }
    
    
    /// Método que convierte un String a Double si es un número valido.
    ///
    /// - Parameter inputString: Cadena a convertir.
    /// - Returns: Número del tipo Double si la conversión fue exitosa.
    func toDouble(inputString: String) -> Double? {
        
        return self.formatterInput.number(from: inputString)?.doubleValue
    }
    
    /// Evento que se dispara cuando el usuario presiona un boton de numeros.
    ///
    /// - Parameter sender: Button que activa el evento y que lee el número asignado o el punto decimal.
    @IBAction func pressNumberButton(_ sender: UIButton) {
        let value = sender.titleLabel?.text
                
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
        self.operacion = .SIN_OPERACION
        self.total = 0
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
    
    /// Action que agrega el signo minus al número capturado
    /// - Parameter sender: Botton PlusMinus
    @IBAction func buttonPlusMinus(_ sender: UIButton) {

        let value:String? = self.capturaLabel.text
        
        // Validación para solo introducir el signo solo una vez
        if ((value?.contains("-")) == false) {
            self.capturaLabel.text!.insert("-", at: value!.startIndex)
        } else {
            self.capturaLabel.text = value!.trimmingCharacters(in: ["-"])
        }
        
    }
    
    
    @IBAction func buttonEqual(_ sender: UIButton) {
        
        // Ultimo valor que capturo el usuario
        let dataCapture = self.capturaLabel.text
        
        // Se selecciona la operacion que tecleo el usuario
        switch self.operacion {
        case .SIN_OPERACION:
            self.total = 0
            
            break
        case .SUMA:
            self.total = self.total + self.toDouble(inputString: dataCapture!)!
            self.capturaLabel.text = self.total.formatted()
            
            break
        case .RESTA:
            self.total = self.total - self.toDouble(inputString: dataCapture!)!
            self.capturaLabel.text = self.total.formatted()
            
            break
        case .MULTIPLICACION:
            self.total = self.total * self.toDouble(inputString: dataCapture!)!
            self.capturaLabel.text = self.total.formatted()
            
            break
        case .DIVISION:
            
            let valor = self.toDouble(inputString: dataCapture!)!
            if(valor == 0){
                self.capturaLabel.text = self.DIVISION_ZERO
            } else{
                self.total = self.total / valor
                self.capturaLabel.text = self.total.formatted()
            }
            
            break
        case .RESIDUO:
            self.total = self.total / self.toDouble(inputString: dataCapture!)!
            
            break
        }
        
    }
    
    /// Action que agrega que agrega el estado de SUMA y agrega el número capturado
    /// - Parameter sender: Botton Plus
    @IBAction func buttonPlusOperation(_ sender: UIButton) {
        
        self.operacion = .SUMA
        let dataCapture = self.capturaLabel.text
        self.total = self.toDouble(inputString: dataCapture!)!
        self.capturaLabel.text = self.ZERO
    }
    
    /// Action que agrega que agrega el estado de RESTA y agrega el número capturado
    /// - Parameter sender: Botton Minus
    @IBAction func buttonMinusOperation(_ sender: UIButton) {
        
        self.operacion = .RESTA
        let dataCapture = self.capturaLabel.text
        self.total = self.toDouble(inputString: dataCapture!)!
        self.capturaLabel.text = self.ZERO
    }
    
    /// Action que agrega que agrega el estado de MULTIPLICACION y agrega el número capturado
    /// - Parameter sender: Botton Plus
    @IBAction func buttonMultiplicationOperation(_ sender: UIButton) {
        
        self.operacion = .MULTIPLICACION
        let dataCapture = self.capturaLabel.text
        self.total = self.toDouble(inputString: dataCapture!)!
        self.capturaLabel.text = self.ZERO
    }
    
    /// Action que agrega que agrega el estado de DIVISION y agrega el número capturado
    /// - Parameter sender: Botton Plus
    @IBAction func buttonDivisionOperation(_ sender: UIButton) {
        self.operacion = .DIVISION
        let dataCapture = self.capturaLabel.text
        self.total = self.toDouble(inputString: dataCapture!)!
        self.capturaLabel.text = self.ZERO
    }
    
}

