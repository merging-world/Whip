//
//  ItemDetailView.swift
//  Whip
//
//  Created by peo on 2022/06/24.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var showModal: Bool
    @State var isRemove = true
    @State var selectedKind: Kind = .pay {
        didSet {
            self.model.kind = self.selectedKind
        }
    }
    var isNew = false
    @ObservedObject var viewModel: CameraViewModel
    @State var model: TransactionItemModel
    
    let numberFormatter = NumberFormatter()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(self.numberFormatter.string(for: self.model.money) ?? "0" + "원")
                            .font(.system(size: 30))
                            .fontWeight(.medium)
                        
                        Text("명세서 I 인식 금액 \(self.numberFormatter.string(for: self.model.money) ?? "0")원")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .foregroundColor(.darkGray)
                            .padding(.top, 12)
                    }
                    Spacer()
                    
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.fontColor)
                        .onTapGesture {
                            self.showModal = false
                        }
                }
                .padding(.top, 52)
                
                self.kindLine
                    .padding(.top, 16)
                
                self.tradePlaceLine
                
                self.paymentLine
                
                self.dateLine
                
                self.memoLine
                
                self.removeToggle
                Spacer()
                
                if self.isNew {
                    Text(self.viewModel.model.resultText)
                }
                
                self.saveButton
            }
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .onAppear {
            self.numberFormatter.numberStyle = .decimal
            self.model.money = abs(self.model.money)
            self.selectedKind = self.model.kind
        }
    }
}

extension ItemDetailView {
    @ViewBuilder
    var lineNextIcon: some View {
        Image(systemName: "chevron.right")
            .resizable()
            .frame(width: 6, height: 12)
            .foregroundColor(.gray)
    }
    
    @ViewBuilder
    var saveButton: some View {
        Button(action: {
            self.showModal = false
        }) {
            Text("저장하기")
                .bold()
        }
        .buttonStyle(
            BigButtonStyle(
                fontSize: 18,
                fontColor: .white,
                backgroundColor: .carrot
            )
        )
    }
    
    @ViewBuilder
    func kindText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .foregroundColor(.darkGray)
    }
    
    @ViewBuilder
    var kindLine: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 0) {
                self.kindText("분류")
                
                HStack(spacing: 8) {
                    ForEach(Kind.allCases, id: \.self) { kind in
                        kind.buttonView
                            .background(
                                Group {
                                    if kind == self.selectedKind {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.carrot)
                                    } else {
                                        RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.modernGray)
                                    }
                                }
                            )
                            .foregroundColor(kind == self.selectedKind ? .white : .modernGray)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                self.selectedKind = kind
                            }
                    }
                }
                .padding(.leading, 48)
                .offset(y: 8)
                Spacer()
                self.lineNextIcon
            }
            CustomDivider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var tradePlaceLine: some View {
        VStack {
            HStack(spacing: 0) {
                self.kindText("거래처")
                
                Text(self.model.title)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.fontColor)
                    .padding(.leading, 32)
                Spacer()
                
                self.lineNextIcon
            }
            CustomDivider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var paymentLine: some View {
        VStack {
            HStack(spacing: 0) {
                self.kindText("결제수단")
                
                TextField("", text: .constant("부자되세요 더 마일리지카드(체크)"))
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.fontColor)
                    .padding(.leading, 20)
                Spacer()
                
                self.lineNextIcon
            }
            CustomDivider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var dateLine: some View {
        VStack {
            HStack(spacing: 0) {
                self.kindText("날짜")
                
                Text("2022년 6월 24일 오후 3:13")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.fontColor)
                    .padding(.leading, 48)
                Spacer()
                
                self.lineNextIcon
            }
            CustomDivider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var memoLine: some View {
        VStack {
            HStack(spacing: 0) {
                self.kindText("메모")
                
                Text("메모 및 #태그를 입력해주세요")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.modernGray)
                    .padding(.leading, 48)
                Spacer()
                
                self.lineNextIcon
            }
            CustomDivider(height: 1, horizontalPadding: 24)
                .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    var removeToggle: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("예산에서 제외")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.darkGray)
                
                if self.isRemove {
                    Text("이 내역을 예산에 포함하지 않습니다")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(.blueGray)
                        .lineLimit(1)
                        .padding(.top, 4)
                }
            }
            Spacer()
            
            Toggle(isOn: self.$isRemove, label: { })
                .frame(width: 120)
        }
    }
}

enum Kind: String, CaseIterable {
    case pay = "지출"
    case income = "수입"
    
    var color: Color {
        switch self {
        case .pay:
            return .whip
        case .income:
            return .carrot
        }
    }
    
    var halfColor: Color {
        switch self {
        case .pay:
            return .greenHalf
        case .income:
            return .orangeHalf
        }
    }
    
    @ViewBuilder
    var buttonView: some View {
        Text(self.rawValue)
            .font(.system(size: 16))
            .bold()
            .padding(.horizontal, 36)
            .padding(.vertical, 8)
            .lineLimit(1)
    }
}
