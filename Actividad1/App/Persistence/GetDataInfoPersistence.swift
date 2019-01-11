//
//  GetDataInfoPersistence.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 gs. All rights reserved.
//

import Foundation



/*Persistencia Data*/
class GetInfoAgenda{
    
    func GetDataBD()->[Persona]{
        
       
        let Persona1=Persona.init(idpersona: 2, nombre: "Jose Alberto",fechanacimiento: "19771006", correoelectronico: "josealberto@elektra.com.mx" , password: "1234", numeroempleado: "302020", telefono: "555522663377")
        let Persona2=Persona.init(idpersona: 2, nombre: "Noel Fuentes",fechanacimiento: "19771006", correoelectronico: "nfuentes@elektra.com.mx" , password: "1234", numeroempleado: "302020", telefono: "555522663377")
  
        
    
      
        var arrayPersonasBD = [Persona]();
        arrayPersonasBD.append(Persona1);
        arrayPersonasBD.append(Persona2);
       

        return arrayPersonasBD
    }

    
}
