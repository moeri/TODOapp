//
//  CreateView.swift
//  todo
//
//  Created by 荒井萌里 on 2023/01/24.
//

import SwiftUI

struct CreateView: View {
    enum Result {
        case save(String)
        case cancel
    }
    
    @State var name: String = ""
    @Binding var isPresented: Bool
    @Binding var result: Result
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("名前")
                    Spacer(minLength: 32)
                    TextField("", text: $name)
                        .textFieldStyle(.roundedBorder)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("項目の追加")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("追加", action: {
                        result = .save(name)
                        isPresented = false
                    })
                    .disabled(name.isEmpty)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("キャンセル", action: {
                        result = .cancel
                        isPresented = false
                    })
                }
            }
        }
    }
}

private struct PreviewWrapper: View {
    @State var isPresented = false
    @State var result = CreateView.Result.cancel
    
    var body: some View {
        CreateView(
            isPresented: $isPresented,
            result: $result
        )
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
