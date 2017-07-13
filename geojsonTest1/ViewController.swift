//
//  ViewController.swift
//  geojsonTest1
//
//  Created by Jonathan Nehring on 7/13/17.
//  Copyright © 2017 Stonetip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var mapViewC: MaplyViewController!
    

   fileprivate var landUseSource: GeoJSONSource?
    
    private var keys : NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        
        mapViewC = MaplyViewController(mapType: .typeFlat)
        
        self.view.addSubview((mapViewC.view)!)
        
        self.view.sendSubview(toBack: (mapViewC.view)!)
        
        
        
        mapViewC.view.frame = self.view.bounds
        
        addChildViewController(mapViewC)
        
        
        mapViewC.frameInterval = 2
        
        
        let lat: Float = 46.6
        let lon: Float = -112
        
        mapViewC.height = 0.1
        mapViewC.heading = 0
        mapViewC.animate(toPosition: MaplyCoordinateMakeWithDegrees(lon, lat), time: 0.5)
        
        

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            
            self.landUseSource = GeoJSONSource.init(viewC: self.mapViewC, geoJSONURL: Bundle.main.url(forResource: "elkhornsR", withExtension: "json")!, sldURL: Bundle.main.url(forResource: "va_pw", withExtension: "sld")!, relativeDrawPriority: 103)
            
            self.landUseSource?.startParse()
            
        }
        
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

