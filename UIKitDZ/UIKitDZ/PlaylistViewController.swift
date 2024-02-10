// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Класс PlaySongViewController где проигрываются треки
class PlaySongViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var backgroundValueSong: UIImageView!
    @IBOutlet var imageSong: UIImageView!
    @IBOutlet var titleSong: UILabel!
    @IBOutlet var nameOfSong: UILabel!
    @IBOutlet var sliderSong: UISlider!
    @IBOutlet var endTimeLabel: UILabel!
    @IBOutlet var previousSong: UIButton!
    @IBOutlet var secondSong: UIButton!

    // MARK: - Public Properties

    // Дефолтные значения для наших View что бы в них передать значения с прошлого ViewController'a
    public var player = AVAudioPlayer()
    public var defaultSongImage = UIImage()
    public var defaultTitleSong = ""
    public var defaultNameOfSong = ""
    public var isSound = true

    // MARK: - Private Properties

    private var timer = Timer()
    private var namesOfSongs = [PlayList.trak1.nameOfSong, PlayList.trak2.nameOfSong]

    override func viewDidLoad() {
        super.viewDidLoad()
        appdateInformationOnScreen()
        settingSlider()
        previousSong.addTarget(self, action: #selector(switchSong), for: .touchDown)
        secondSong.addTarget(self, action: #selector(switchSong), for: .touchDown)
    }

    // MARK: IBAction

    /// Кнопка "плей"/"стоп"
    @IBAction private func stopButton(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            sender.setImage(UIImage(systemName: "play"), for: .normal)
        } else {
            player.play()
            sender.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        }
    }

    /// Двигаем слайдер
    @IBAction func sliderSongAction(_ sender: UISlider) {
        if sender == sliderSong {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    /// Перемотка слайдера на 30 секунд назад
    @IBAction func reloadBack(_ sender: Any) {
        player.currentTime -= 30.0
    }

    /// Перемотка слайдера на 30 секунд вперед
    @IBAction func reloadForward(_ sender: Any) {
        player.currentTime += 30.0
    }

    /// Вкл/выкл звук
    @IBAction func offSound(_ sender: UIButton) {
        if isSound {
            player.volume = 0.0
            isSound = false
            sender.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
        } else {
            player.volume = 1.0
            isSound = true
            sender.setImage(UIImage(systemName: "speaker.wave.1.fill"), for: .normal)
        }
    }

    // MARK: - Private Methods

    /// Обновление нашего оставшегося времени до конца трека
    @objc private func relodeTime() {
        let allTime = player.currentTime - player.duration
        let minutes = Int(allTime / 60)
        let seconds = -Int(allTime.truncatingRemainder(dividingBy: 60))
        endTimeLabel.text = NSString(format: "%02d:%02d", minutes, seconds) as String
        sliderSong.setValue(Float(player.currentTime), animated: true)
    }

    /// Обновление данных на экране после их передачи
    private func appdateInformationOnScreen() {
        backgroundValueSong.layer.cornerRadius = 20
        imageSong.image = defaultSongImage
        titleSong.text = defaultTitleSong
        nameOfSong.text = defaultNameOfSong
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(relodeTime),
            userInfo: nil,
            repeats: true
        )
    }

    /// Установка минимального и максимального значения слайдера
    private func settingSlider() {
        sliderSong.minimumValue = 0.0
        sliderSong.maximumValue = Float(player.duration)
    }

    /// Переключение песен
    @objc private func switchSong(_ sender: UIButton) {
        if nameOfSong.text == PlayList.trak1.nameOfSong {
            imageSong.image = UIImage(named: PlayList.trak2.imgName)
            titleSong.text = PlayList.trak2.title
            nameOfSong.text = PlayList.trak2.nameOfSong
            if let audioPath = Bundle.main.path(forResource: namesOfSongs.last, ofType: "mp3") {
                do {
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    player.play()
                } catch {
                    print("Erorr")
                }
            }
        } else {
            imageSong.image = UIImage(named: PlayList.trak1.imgName)
            titleSong.text = PlayList.trak1.title
            nameOfSong.text = PlayList.trak1.nameOfSong
            if let audioPath = Bundle.main.path(forResource: namesOfSongs.first, ofType: "mp3") {
                do {
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    player.play()
                } catch {
                    print("Erorr")
                }
            }
        }
    }

    /// Кнопка поделиться
    @IBAction func sharedButton(_ sender: UIButton) {
        let activitt = UIActivityViewController(activityItems: ["https://vk.com"], applicationActivities: nil)
        activitt.popoverPresentationController?.sourceView = view
        present(activitt, animated: true)
    }

    /// Открыть плейлист
    @IBAction func openPlaylist(_ sender: UIButton) {
        dismiss(animated: true)
        player.pause()
    }

    /// Закрыть проигрыватель
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true)
        player.pause()
    }
}
