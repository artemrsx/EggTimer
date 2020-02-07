import UIKit

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft": 300,
        "Medium": 420,
        "Hard": 720
    ]
    var totalTime = 0;
    var secondsPassed = 0;
    var timer = Timer();
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var appTitle: UILabel!
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
