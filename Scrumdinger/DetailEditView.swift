//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Gordon Choi on 2023/05/23.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    
    var body: some View {
        Form {
            Section(header: Text("Meeting info")) {
                TextField("Title", text: $scrum.title)
                
                HStack {
                    // 슬라이더 시간은 앱 정책적인 부분으로, 나중에 뺄 수 있을 듯 합니다
                    // 그럼 시간을 정하는 것도 프로퍼티 래퍼로 감싸 줘서 5~30 사이만 할 수 있게 만든다면?
                    Slider(value: $scrum.lengthInMinutesAsDouble,
                           in: 5...30,
                           step: 1) {
                        Text("Length")
                    }
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
