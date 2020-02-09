import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    var totalTime = 0;
    var secondsPassed = 0;
    var timer = Timer();
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var appTitle: UILabel!
    
    // @objc
    @objc func update() {
        if (secondsPassed < totalTime) {
            let progress = Float(secondsPassed)/Float(totalTime);
            let progressText = String(Int(progress * 100)) + " %";
            secondsPassed += 1;
            progressBar.progress = progress;
            progressLabel.text = progressText;
        } else {
            appTitle.text = "DONE !!!";
            progressLabel.text = "100 %";
            progressBar.progress = 1;
            timer.invalidate();
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    @IBAction func onEggPress(_ sender: UIButton) {
        timer.invalidate();
        
        let title: String! = sender.currentTitle;
        
        totalTime = eggTimes[title]!;
        appTitle.text = title;
        secondsPassed = 0;
        progressBar.progress = 0;
        progressLabel.text = "0 %";
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    

}
