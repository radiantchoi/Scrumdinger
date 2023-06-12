//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Gordon Choi on 2023/06/13.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                
                Text("Attendees")
                    .font(.headline)
                
                Text(history.attendeeString)
                
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(attendees: [
            DailyScrum.Attendee(name: "Bill"),
            DailyScrum.Attendee(name: "Gordon")
        ],
                transcript: "I am going to study about TCA and Tuist")
    }
    
    static var previews: some View {
        HistoryView(history: history)
    }
}
