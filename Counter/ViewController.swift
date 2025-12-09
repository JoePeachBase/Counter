import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var increaseCounterButton: UIButton!
    @IBOutlet private weak var decreaseCounterButton: UIButton!
    @IBOutlet private weak var resetCounterButton: UIButton!
    @IBOutlet private weak var logTextView: UITextView!
    
    private var counterValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCounterLabel()
        setupCounterButtons()
        setupCounterLogView()
    }
    
    private func setupCounterLabel() {
        counterLabel.text = "Значение счётчика: \(counterValue)"
        counterLabel.textAlignment = .center
    }
    
    private func setupCounterButtons() {
        increaseCounterButton.setTitle("+1", for: .normal)
        increaseCounterButton.tintColor = .white
        increaseCounterButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        increaseCounterButton.layer.cornerRadius = 15
        
        decreaseCounterButton.setTitle("-1", for: .normal)
        decreaseCounterButton.tintColor = .white
        decreaseCounterButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        decreaseCounterButton.layer.cornerRadius = 15
        
        resetCounterButton.setTitle("Сбросить", for: .normal)
        resetCounterButton.setImage(UIImage(systemName: "arrow.counterclockwise.circle.fill"), for: .normal)
        resetCounterButton.tintColor = .white
        resetCounterButton.backgroundColor = #colorLiteral(red: 1, green: 0.1492490768, blue: 0, alpha: 1)
        resetCounterButton.layer.cornerRadius = 15
    }
    
    private func setupCounterLogView() {
        logTextView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        logTextView.text = "История изменений:\n"
        logTextView.isEditable = false
        logTextView.isScrollEnabled = true
        logTextView.layer.cornerRadius = 15
    }
    
    private func addLog(message: String) {
        let date = Date()
        let logEntry = "\(date.formatted()) \(message)"
        logTextView.text = logEntry + logTextView.text
    }

    @IBAction private func increaseCounterButtonDidTapped(_ sender: Any) {
        counterValue += 1
        counterLabel.text = "Значение счётчика: \(counterValue)"
        addLog(message: "значение изменено на +1\n")
    }
    
    @IBAction private func decreaseCounterButtonDidTapped(_ sender: Any) {
        guard counterValue > 0 else {
            addLog(message: "попытка уменьшить значение счётчика ниже 0\n")
            return }
        counterValue -= 1
        counterLabel.text = "Значение счётчика: \(counterValue)"
        addLog(message: "значение изменено на -1\n")
    }
    
    @IBAction private func counterResetButton(_ sender: Any) {
        counterValue = 0
        counterLabel.text = "Значение счётчика: \(counterValue)"
        addLog(message: "значение сброшено\n")
    }
}

