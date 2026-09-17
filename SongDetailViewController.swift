//
//  SongDetailViewController.swift
//  MyConcertApp
//
//  Created by Can on 14.07.2026.
//

import Foundation

import UIKit
import AVKit
import AVFoundation

struct LyricLine {
    let time: Double
    let text: String
}

class SongDetailViewController: UIViewController {
    

    @IBOutlet weak var videoContainerView: UIView!
  
    @IBOutlet weak var lyricsTableView: UITableView!
    
    var selectedSong: Song?

      private var player: AVPlayer?
      private var playerController: AVPlayerViewController?

      private var lyricLines: [LyricLine] = []
      private var currentLyricIndex: Int = -1
      private var timeObserverToken: Any?

      private let gradientLayer = CAGradientLayer()

      override func viewDidLoad() {
          super.viewDidLoad()

          configureBackground()
          configureNavigationBar()
          configureLyricsTableView()

          guard let song = selectedSong else {
             
              return
          }

          title = song.name
         

          let lyricsText = loadLyrics(
              fileName: song.lyricsFile
          )

          lyricLines = parseLyrics(lyricsText)

          lyricsTableView.reloadData()

          playVideo(
              fileName: song.videoName
          )
      }

      override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()

          gradientLayer.frame = view.bounds
          playerController?.view.frame = videoContainerView.bounds
      }

      private func configureBackground() {

          gradientLayer.colors = [
              UIColor(
                  red: 10 / 255,
                  green: 20 / 255,
                  blue: 60 / 255,
                  alpha: 1
              ).cgColor,

              UIColor(
                  red: 45 / 255,
                  green: 20 / 255,
                  blue: 80 / 255,
                  alpha: 1
              ).cgColor,

              UIColor.black.cgColor
          ]

          gradientLayer.startPoint = CGPoint(
              x: 0.5,
              y: 0
          )

          gradientLayer.endPoint = CGPoint(
              x: 0.5,
              y: 1
          )

          view.layer.insertSublayer(
              gradientLayer,
              at: 0
          )
      }

      private func configureNavigationBar() {

          let appearance = UINavigationBarAppearance()
          appearance.configureWithTransparentBackground()

          appearance.titleTextAttributes = [
              .foregroundColor: UIColor.white
          ]

          appearance.largeTitleTextAttributes = [
              .foregroundColor: UIColor.white
          ]

          navigationController?
              .navigationBar
              .standardAppearance = appearance

          navigationController?
              .navigationBar
              .scrollEdgeAppearance = appearance

          navigationController?
              .navigationBar
              .compactAppearance = appearance

          navigationController?
              .navigationBar
              .tintColor = .white
      }

      private func configureLyricsTableView() {

          lyricsTableView.delegate = self
          lyricsTableView.dataSource = self

          lyricsTableView.backgroundColor = .clear
          lyricsTableView.separatorStyle = .none
          lyricsTableView.showsVerticalScrollIndicator = false
          lyricsTableView.allowsSelection = false

          lyricsTableView.rowHeight = UITableView.automaticDimension
          lyricsTableView.estimatedRowHeight = 90

          lyricsTableView.contentInset = UIEdgeInsets(
              top: 20,
              left: 0,
              bottom: 100,
              right: 0
          )
      }

      private func loadLyrics(fileName: String) -> String {

          print(Bundle.main.bundlePath)

          guard let fileURL = Bundle.main.url(
              forResource: fileName,
              withExtension: "txt"
          ) else {
              return """
              
              """
          }

          do {
              return try String(
                  contentsOf: fileURL,
                  encoding: .utf8
              )
          } catch {
              return """
              
              """
          }
      }

      private func playVideo(fileName: String) {

          guard let videoURL = Bundle.main.url(
              forResource: fileName,
              withExtension: "mp4"
          ) else {
              print("Video bulunamadı: \(fileName).mp4")
              return
          }

          player = AVPlayer(url: videoURL)

          let controller = AVPlayerViewController()

          controller.player = player
          controller.showsPlaybackControls = true
          controller.videoGravity = .resizeAspectFill

          addChild(controller)

          controller.view.frame = videoContainerView.bounds

          controller.view.autoresizingMask = [
              .flexibleWidth,
              .flexibleHeight
          ]

          videoContainerView.addSubview(
              controller.view
          )

          controller.didMove(
              toParent: self
          )

          playerController = controller

          addPlayerTimeObserver()
      }

      private func addPlayerTimeObserver() {

          guard let player else {
              return
          }

          if let timeObserverToken {
              player.removeTimeObserver(
                  timeObserverToken
              )

              self.timeObserverToken = nil
          }

          let interval = CMTime(
              seconds: 0.1,
              preferredTimescale: 600
          )

          timeObserverToken = player.addPeriodicTimeObserver(
              forInterval: interval,
              queue: .main
          ) { [weak self] time in

              guard let self else {
                  return
              }

              let currentTime = time.seconds

              guard currentTime.isFinite else {
                  return
              }

              self.updateCurrentLyric(
                  currentTime: currentTime
              )
          }
      }

      private func updateCurrentLyric(
          currentTime: Double
      ) {

          guard !lyricLines.isEmpty else {
              return
          }

          var newLyricIndex = -1

          for index in lyricLines.indices {

              if currentTime >= lyricLines[index].time {
                  newLyricIndex = index
              } else {
                  break
              }
          }

          guard newLyricIndex != currentLyricIndex else {
              return
          }

          let previousLyricIndex = currentLyricIndex
          currentLyricIndex = newLyricIndex

          var rowsToReload: [IndexPath] = []

          if lyricLines.indices.contains(previousLyricIndex) {
              rowsToReload.append(
                  IndexPath(
                      row: previousLyricIndex,
                      section: 0
                  )
              )
          }

          if lyricLines.indices.contains(currentLyricIndex) {
              rowsToReload.append(
                  IndexPath(
                      row: currentLyricIndex,
                      section: 0
                  )
              )
          }

          if !rowsToReload.isEmpty {

              lyricsTableView.reloadRows(
                  at: rowsToReload,
                  with: .fade
              )
          }

          scrollToCurrentLyric()
      }

      private func scrollToCurrentLyric() {

          guard lyricLines.indices.contains(
              currentLyricIndex
          ) else {
              return
          }

          let indexPath = IndexPath(
              row: currentLyricIndex,
              section: 0
          )

          lyricsTableView.scrollToRow(
              at: indexPath,
              at: .middle,
              animated: true
          )
      }

      private func parseLyrics(
          _ lyrics: String
      ) -> [LyricLine] {

          var result: [LyricLine] = []

          let lines = lyrics.components(
              separatedBy: .newlines
          )

          for line in lines {

              let cleanedLine = line.trimmingCharacters(
                  in: .whitespacesAndNewlines
              )

              guard
                  cleanedLine.hasPrefix("["),
                  let closingBracketIndex =
                      cleanedLine.firstIndex(of: "]")
              else {
                  continue
              }

              let timeStartIndex = cleanedLine.index(
                  after: cleanedLine.startIndex
              )

              let timeString = String(
                  cleanedLine[
                      timeStartIndex..<closingBracketIndex
                  ]
              )

              let lyricTextStartIndex = cleanedLine.index(
                  after: closingBracketIndex
              )

              let lyricText = String(
                  cleanedLine[lyricTextStartIndex...]
              ).trimmingCharacters(
                  in: .whitespaces
              )

              guard !lyricText.isEmpty else {
                  continue
              }

              let timeComponents = timeString.split(
                  separator: ":"
              )

              guard
                  timeComponents.count == 2,
                  let minutes = Double(
                      timeComponents[0]
                  ),
                  let seconds = Double(
                      timeComponents[1]
                  )
              else {
                  continue
              }

              let totalSeconds =
                  (minutes * 60) + seconds

              result.append(
                  LyricLine(
                      time: totalSeconds,
                      text: lyricText
                  )
              )
          }

          return result.sorted {
              $0.time < $1.time
          }
      }

      deinit {

          if let timeObserverToken,
             let player {

              player.removeTimeObserver(
                  timeObserverToken
              )
          }
      }
    }
extension SongDetailViewController:
    UITableViewDataSource,
    UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {

        return lyricLines.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "LyricCell",
            for: indexPath
        )

        let lyric = lyricLines[indexPath.row]

        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.selectionStyle = .none

        cell.textLabel?.text = lyric.text
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textAlignment = .left

        if indexPath.row == currentLyricIndex {

            cell.textLabel?.textColor = .white

            cell.textLabel?.font = UIFont.systemFont(
                ofSize: 31,
                weight: .heavy
            )

            cell.contentView.alpha = 1

        } else {

            cell.textLabel?.textColor =
                UIColor.white.withAlphaComponent(0.32)

            cell.textLabel?.font = UIFont.systemFont(
                ofSize: 25,
                weight: .bold
            )

            cell.contentView.alpha = 0.75
        }

        return cell
    }

    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {

        return UITableView.automaticDimension
    }

    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {

        cell.transform = CGAffineTransform(
            translationX: 0,
            y: 12
        )

        cell.alpha = 0

        UIView.animate(
            withDuration: 0.3
        ) {
            cell.transform = .identity
            cell.alpha = 1
        }
    }
}
   
