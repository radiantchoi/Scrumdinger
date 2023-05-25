//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Gordon Choi on 2023/05/16.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
