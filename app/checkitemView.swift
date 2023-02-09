//
//  checkitemView.swift
//  todo
//
//  Created by 荒井萌里 on 2023/01/24.
//

import SwiftUI

struct CheckItemView: View {
    @Binding var checkItem: CheckItem
    
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                checkItem.isChecked.toggle()
            }, label: {
                Image(
                    systemName: checkItem.isChecked
                    ? "checkmark.circle.fill"
                    : "circle"
                )
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(
                    checkItem.isChecked
                        ? Color.gray
                        : Color.gray
                )
            })
            Text(checkItem.name)
            .foregroundColor(
                checkItem.isChecked
                    ? Color.gray
                    : Color.black
            )
            Spacer()
        }
    }
}

private struct PreviewWrapper: View {
    @State var checkItem1 = CheckItem(isChecked: false, name: "りんご")
    @State var checkItem2 = CheckItem(isChecked: true, name: "バナナ")
    
    var body: some View {
        VStack {
            CheckItemView(checkItem: $checkItem1)
            CheckItemView(checkItem: $checkItem2)
        }
    }
}

struct checkitemView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
