//
//  ViewControllerPersonajes.swift
//  pruebaRA
//
//  Created by Mu qi Zhang on 27/12/2019.
//  Copyright © 2019 tallerapps. All rights reserved.
//

import UIKit
import RealityKit
import ARKit


//
//
// MARK: View Controller Personajes
//
//

class ViewControllerPersonajes: UIViewController {
    
    /// Views
    @IBOutlet var viewPersonajes: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var viewFondo: UIView!
    
    @IBOutlet weak var viewArriba: UIView!
    @IBOutlet weak var viewAbajo: UIView!
    
    /// Botones
    @IBOutlet weak var botonSekilin: UIButton!
    @IBOutlet weak var botonSekilina: UIButton!
    @IBOutlet weak var botonCoski: UIButton!
    
    /// Imagen y Texto Desliza
    @IBOutlet weak var imagenDesliza: UIImageView!
    @IBOutlet weak var textoDesliza: UILabel!
    
    
    ///
    /// Funciones de Botones
    ///
    @IBAction func pulsarBotonSekilin(_ sender: Any) {
        activarPersonaje = .sekilin
        desactivarPersonajeAnterior = true
    }
    
    @IBAction func pulsarBotonSekilina(_ sender: Any) {
        activarPersonaje = .sekilina
        desactivarPersonajeAnterior = true
    }
    
    @IBAction func pulsarBotonCoski(_ sender: Any) {
        activarPersonaje = .coski
        desactivarPersonajeAnterior = true
    }
}
