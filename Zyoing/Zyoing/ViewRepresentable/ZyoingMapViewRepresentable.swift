//
//  ZyoingMapViewRepresentable.swift
//  Zyoing
//
//  Created by Krishna on 07/07/23.
//

import SwiftUI
import MapKit


struct ZyoingMapViewRepresentable: UIViewRepresentable {
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
         
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        let mapViewCoordinator = MapViewCoordinator(parent: self)
        return mapViewCoordinator
    }
    
}


extension ZyoingMapViewRepresentable {
    
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        let parent: ZyoingMapViewRepresentable
        
        init(parent: ZyoingMapViewRepresentable) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
