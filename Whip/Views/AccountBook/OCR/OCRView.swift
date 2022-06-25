//
//  OCRView.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI
import AVFoundation

struct OCRView: View {
    @StateObject var viewModel = CameraViewModel()
    @State var isPressed = false
    @Binding var isOnOCRView: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                viewModel.cameraPreview
                    .onAppear {
                        viewModel.configure()
                    }
                
                VStack {
                    
                    HStack{
                        Spacer()
                        // 사진찍기 버튼
                        Button(action: {
                            viewModel.capturePhoto()
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                                self.isPressed = true
                            }
                        }) {
                            VStack {
                                Circle()
                                    .stroke(lineWidth: 5)
                                    .fill(Color.carrot)
                                    .frame(width: 80, height: 80)
                                    .padding()
                                    .shadow(color: Color(red: 40/255, green: 67/255, blue: 135/255).opacity(0.25), radius: 10, x: 0, y: 4)
                                
                                Text("촬영")
                                    .font(.system(size: 16))
                                    .foregroundColor(.carrot)
                            }
                        }
                        .sheet(isPresented: self.$isPressed) {
                            ItemDetailView(showModal: self.$isPressed, isNew: true, viewModel: self.viewModel, model: TransactionItemModel(title: "STARBUCKS 가락시장역점", kind: .pay, money: -7900))
                        }
                        Spacer()
                    }
                    .padding(.top, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("닫기") {
                        self.isOnOCRView = false
                    }
                }
            }
        }
    }
}
