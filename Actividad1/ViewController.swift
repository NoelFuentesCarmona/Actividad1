//
//  ViewController.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 gs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
        let lbMessage = UILabel(frame: CGRect(x: 00, y:600, width: 400, height: 50))
    var personalogeada : Persona? ;
    
    
  
    
    
    override func viewDidLoad() {
        
        lbMessage.textAlignment = .center
        self.view.addSubview(lbMessage)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func txtUserAction(_ sender: UITextField) {
        clearMessage()
        if(!isValidEmail(string: sender.text!) && !(sender.text?.isEmpty)!){
            mostrarMenssage("Favor de colocar un correo valido", Int(sender.frame.origin.x), Int(sender.frame.origin.y)+Int(sender.frame.size.height))
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcd = segue.destination as? AdminViewController{
            vcd.UsuarioLogeado = personalogeada
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "recoverPasswordSegue":
            print("Recuperando contraseña");
        case "loginSegue":
            var loginResult = PersonaCore.init().IniciarSesion(txtUser.text!,txtPassword.text!)
                var result = ( loginResult != nil) ? true  : false ;
            if result{
                personalogeada = loginResult!    ;

            }
            else{

                let alerta: UIAlertController = UIAlertController.init(title: "Mi aplicacion", message: "Usuario no registrado", preferredStyle: UIAlertController.Style.alert);
                let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);

               alerta.addAction(okAlerta)
                present(alerta, animated: true, completion: nil);
                 return false
                
           }
        default:
            print("cualquier") ;
        }
        return true;
    }
    
    
    
    @objc func isValidEmail(string: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: string)
    }
    
    @objc func onlyNummbers(_ cadena : String) -> Bool{
        if(!cadena.isEmpty)
        {let num = Int(cadena);
            if num != nil {
                return true;
            }
            else {
                return false;
            }}
        else{return true}
    }
    
    
    
    // MARK: - Message
    
    @objc func mostrarMenssage(_ mensaje : String , _ Xpx : Int , _ Ypx : Int , _ tipo : Bool = false)->Void{
        lbMessage.text=mensaje;
        lbMessage.frame=CGRect(x: 50, y:Ypx-10, width: 300, height: 50)
        if tipo {
            lbMessage.textColor = .green;
        }
        else{
            lbMessage.textColor = .red;
        }
        lbMessage.layer.cornerRadius = 5;
        
    }
    
    @objc func clearMessage()
    {
        lbMessage.text="";
        lbMessage.backgroundColor=UIColor.clear
    }
    
}

