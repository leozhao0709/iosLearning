//
//  Annotation.swift
//  显示大头针(map)
//
//  Created by Lei Zhao on 8/22/16.
//  Copyright © 2016 Lei Zhao. All rights reserved.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {
    
    // Center latitude and longitude of the annotation view.
    // The implementation of this property must be KVO compliant.
    var coordinate: CLLocationCoordinate2D
    
    // Title and subtitle for use by selection UI.
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }

}
