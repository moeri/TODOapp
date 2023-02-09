//
//  ContentView.swift
//  todo
//
//  Created by 荒井萌里 on 2023/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var checkItems = [
        CheckItem
    ]()
    
    @State var isPresented = false
    @State var createViewResult = CreateView.Result.cancel

    var body: some View {
        NavigationStack {
            List {
                ForEach(checkItems.indices, id: \.self) { index in
                    CheckItemView(checkItem: $checkItems[index])
                }
                .onMove(perform: moveList)
                .onDelete(perform: deleteList)
                Spacer()
            }
            .listStyle(.plain)
            .navigationTitle("TODO List")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        isPresented = true
                    }, label: {
                        Image(
                            systemName: "plus.circle"
                        )
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(
                            Color.gray
                        )
                    })
                }
            }
            .fullScreenCover(
                isPresented: $isPresented, onDismiss: {
                    switch createViewResult {
                    case .save(let name):
                        checkItems.append(
                            CheckItem(
                                isChecked: false,
                                name: name
                            )
                        )
                    case .cancel:
                        break
                    }
                }) {
                CreateView(
                    isPresented: $isPresented,
                    result: $createViewResult
                )
            }
        }
    }
    func moveList(from: IndexSet, to: Int) {
        withAnimation {
            checkItems.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteList(offsets: IndexSet) {
        withAnimation {
            checkItems.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
