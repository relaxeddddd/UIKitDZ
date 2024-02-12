// SongsViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFAudio
import UIKit

/// Класс PlaylistViewController в котором объявляются треки
final class PlaylistViewController: UIViewController {
    // MARK: - IB Outlets

    @IBOutlet private var albumImageFirst: UIImageView!
    @IBOutlet private var trackTitleFirtst: UILabel!
    @IBOutlet private var nameOfSongFirst: UILabel!
    @IBOutlet private var durationFirst: UILabel!
    @IBOutlet private var albumImageTwice: UIImageView!
    @IBOutlet private var trackTitleTwice: UILabel!
    @IBOutlet private var nameOfSongTwice: UILabel!
    @IBOutlet private var durationTwice: UILabel!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        albumImageFirst.image = UIImage(named: PlayList.trak1.imgName)
        durationFirst.text = PlayList.trak1.duration
        nameOfSongFirst.text = PlayList.trak1.nameOfSong
        trackTitleFirtst.text = PlayList.trak1.title

        albumImageTwice.image = UIImage(named: PlayList.trak2.imgName)
        trackTitleTwice.text = PlayList.trak2.title
        nameOfSongTwice.text = PlayList.trak2.nameOfSong
        durationTwice.text = PlayList.trak2.duration
    }

    // MARK: - Private Methods

    @IBAction private func persentSecondViewButtonFirst(_ sender: Any) {
        if let songVC = storyboard?
            .instantiateViewController(withIdentifier: "playSongStoryboard") as? PlaySongViewController
        {
            do {
                if let audioPath = Bundle.main.path(forResource: PlayList.trak1.nameOfSong, ofType: "mp3") {
                    songVC.player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    songVC.defaultSongImage = albumImageFirst.image!
                    songVC.defaultTitleSong = trackTitleFirtst.text!
                    songVC.defaultNameOfSong = nameOfSongFirst.text!
                    songVC.player.play()
                    present(songVC, animated: true)
                }
            } catch {
                print("Error")
            }
        }
    }

    @IBAction private func presentSecondViewButtonTwice(_ sender: Any) {
        if let songVC = storyboard?
            .instantiateViewController(withIdentifier: "playSongStoryboard") as? PlaySongViewController
        {
            do {
                if let audioPath = Bundle.main.path(forResource: PlayList.trak2.nameOfSong, ofType: "mp3") {
                    songVC.player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    songVC.defaultSongImage = albumImageTwice.image!
                    songVC.defaultTitleSong = trackTitleTwice.text!
                    songVC.defaultNameOfSong = nameOfSongTwice.text!
                    songVC.player.play()
                    present(songVC, animated: true)
                }
            } catch {
                print("Error")
            }
        }
    }
}
