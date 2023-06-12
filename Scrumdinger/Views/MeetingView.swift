//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Gordon Choi on 2023/05/16.
//

import AVFoundation
import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    
    @StateObject private var scrumTimer = ScrumTimer()
    @StateObject private var speechRecognizer = SpeechRecognizer()
    
    @State private var isRecording = false
    
    private var dingPlayer: AVPlayer {
        AVPlayer.sharedDingPlayer
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                  secondsRemaining: scrumTimer.secondsRemaining,
                                  theme: scrum.theme)
                
                MeetingTimerView(speakers: scrumTimer.speakers, isRecording: isRecording, theme: scrum.theme)
                
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear {
            startScrum()
        }
        .onDisappear {
            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes,
                         attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            dingPlayer.seek(to: .zero)
            dingPlayer.play()
        }
        
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        isRecording = true
        
        scrumTimer.startScrum()
    }
    
    private func endScrum() {
        scrumTimer.stopScrum()
        
        speechRecognizer.stopTranscribing()
        isRecording = false
        
        let newHistory = History(attendees: scrum.attendees,
                                 transcript: speechRecognizer.transcript)
        scrum.history.insert(newHistory, at: 0)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
