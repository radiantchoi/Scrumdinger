//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Gordon Choi on 2023/06/08.
//

import SwiftUI

final class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
}
