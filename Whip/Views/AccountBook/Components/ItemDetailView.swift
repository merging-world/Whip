//
//  ItemDetailView.swift
//  Whip
//
//  Created by peo on 2022/06/24.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        Button("Save") {
            
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(showModal: .constant(false))
    }
}
