//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Gordon Choi on 2023/05/18.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    let plusButtonAction: () -> Void = { }
    
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                NavigationLink(destination: Text(scrum.title)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: plusButtonAction) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
