//
//  OTPView.swift
//  OTP
//
//  Created by Milan Djordjevic on 08/01/2024.
//

import SwiftUI

struct OTPView: View {
    @State private var code = ""
    @FocusState private var isKeyboardActive: Bool
    
    var body: some View {
        VStack {
            Text("OTP code please")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ForEach(0..<6, id: \.self) { cnt in
                    TextBox(cnt)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                TextField("", text: $code.limit(6))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode) // <- Ovo je novo
                    //.frame(width: 1, height: 1)
                    //.opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardActive)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyboardActive.toggle()
            }
        }
        .padding()
        .frame(maxHeight: .infinity,alignment: .top)
    }
    
    @ViewBuilder
    func TextBox(_ cnt: Int) -> some View {
        ZStack {
            if code.count > cnt {
                Text(charToString(at: cnt))
            } else {
                Text("●")
            }
        }
        .frame(width: 44, height: 44)
        .frame(maxWidth: .infinity)
    }
    
    private func charToString(at cnt: Int) -> String {
        let startIndex = code.startIndex
        let charIndex = code.index(startIndex, offsetBy: cnt)
        return String(code[charIndex])
    }
}



#Preview {
    OTPView()
}
