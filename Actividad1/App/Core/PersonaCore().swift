//
//  PersonaCore().swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 gs. All rights reserved.
//

import Foundation

class PersonaCore{
    
    func IniciarSesion(_ user: String, _ password: String )->Persona?  {
        var userLogin : Persona?
        
      var bdUsuarios =  GetInfoAgenda.init().GetDataBD();
        for usuario in bdUsuarios {
            
            if (usuario.correoelectronico == user && usuario.password == password)
            {
                userLogin=usuario;
                break;
            }
    
        
        }
        return userLogin;
    }
    
    func ValidarUsuario(_ user: String )->Persona?  {
        var userLogin : Persona?
        
        var bdUsuarios =  GetInfoAgenda.init().GetDataBD();
        for usuario in bdUsuarios {
            
            if (usuario.correoelectronico == user)
            {
                userLogin=usuario;
                break;
            }
            
        }
        return userLogin;
    }
    
}
