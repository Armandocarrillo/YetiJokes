

import UIKit
import YetiTheme

public class ViewController: UIViewController {
  
  // MARK: - Instance properties
  public let jokeProvider: JokeProvider = JokeProvider(fileName: "jokes")
  
  // MARK: - Outlets
  @IBOutlet public var textLabel: UILabel!
  @IBOutlet public var segmentedControl: UISegmentedControl!
  
  //MARK: - View Life Cycle
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    textLabel.font = Fonts.small
  }
  
  // MARK: - Actions
  @IBAction public func segmentedControlValueChanged(_ sender: UISegmentedControl) {
    
    switch sender.selectedSegmentIndex {
    case 0:
      textLabel.font = Fonts.small
    case 1:
      textLabel.font = Fonts.medium
    case 2:
      textLabel.font = Fonts.large
    default:
      textLabel.font = Fonts.small
    }
    
  }
  
  @IBAction public func newJokePressed(_ sender: UIButton) {
    guard let joke = jokeProvider.jokes.randomElement() else {
      return
    }

    textLabel.text = joke.question + "\n\n" + joke.answer
  }
}
