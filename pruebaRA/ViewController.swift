//
//  ViewController.swift
//  pruebaRA
//
//  Created by tallerapps on 19/11/2019.
//  Copyright © 2019 tallerapps. All rights reserved.
//

import UIKit
import RealityKit
import ARKit


/// Escenas
var escenaSekilin: ScenePelota.CaraSekilin!
var escenaSekilina: ScenePelota.CaraSekilina!
var escenaCoski: ScenePelota.EscenaCoski!


/// Personajes
enum personajes {
    case sekilin, sekilina, coski, nada
}


/// Controladores de los Personajes y Escenas
var activarPersonaje: personajes = .nada
var desactivarPersonajeAnterior = false


//
//
// MARK: View Controller
//
//

class ViewController: UIViewController {
 
    /// Enlaces (Segues)
    enum Segues {
        static let personajesSegue = "SeguePersonajes"
    }
    
    /// AR View y Configuración
    @IBOutlet weak var arView: ARView!
    
    let cara = ARFaceTrackingConfiguration()

    /// Objetos
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var botonRemove: UIButton!
    
    
    @IBOutlet weak var flechaPersonajes: UIImageView!
    @IBOutlet weak var textoSeleccionarPersonaje: UILabel!
    
    //
    // MARK: View Did Load
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cara.isWorldTrackingEnabled = true
        cara.maximumNumberOfTrackedFaces = 10
        
        
        arView.session.run(cara)
    }
    
    
    //
    // MARK: View Will Appear
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        flechaPersonajes.isHidden = true
        textoSeleccionarPersonaje.isHidden = true
        
    }
    
    
    //
    // MARK: View Will Disappear
    //
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    //
    // MARK: Enlaces
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segues.personajesSegue {
            var _: ViewControllerPersonajes = segue.destination as! ViewControllerPersonajes
        }
    }
    
    
    ///
    // MARK: Funciones de Botones
    ///
    @IBAction func botonPresionado(_ sender: Any) {
   
        if desactivarPersonajeAnterior == true {
            desactivarPersonajeAnterior = false
            arView.scene.anchors.removeAll()
        }
        
        if activarPersonaje == .sekilin {
            cargarCaraSekilin()
            
        } else if activarPersonaje == .sekilina {
            cargarCaraSekilina()
            
        } else if activarPersonaje == .coski {
            cargarCaraCoski()
            
        } else {
            cargarTextoSeleccionarPersonaje()
            
        }
    }
    
    @IBAction func botonRemovePulsado(_ sender: Any) {
        arView.scene.anchors.removeAll()
        activarPersonaje = .nada
    }
    
    
    
    //
    // MARK: Funciones
    //
    
    func cargarCaraSekilin() {
        escenaSekilin = try! ScenePelota.loadCaraSekilin()
        arView.scene.anchors.append(escenaSekilin)
    }
    
    func cargarCaraSekilina() {
        escenaSekilina = try! ScenePelota.loadCaraSekilina()
        arView.scene.anchors.append(escenaSekilina)
    }
    
    func cargarCaraCoski() {
        escenaCoski = try! ScenePelota.loadEscenaCoski()
        arView.scene.anchors.append(escenaCoski)
    }
    
    func cargarTextoSeleccionarPersonaje() {
        flechaPersonajes.animationImages = [UIImage(named: "Flecha")!, UIImage(named: "Imagen full PNG")!]
        flechaPersonajes.animationDuration = 1
        flechaPersonajes.startAnimating()
        flechaPersonajes.isHidden = false
        textoSeleccionarPersonaje.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false, block: {_ in
            self.flechaPersonajes.stopAnimating()
            self.flechaPersonajes.isHidden = true
            self.textoSeleccionarPersonaje.isHidden = true
        })
    }
    
}


    


    
