//
//  HomeView.swift
//  Zyoing
//
//  Created by Krishna on 07/07/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZyoingMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
