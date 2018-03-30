
import UIKit

class ViewControllerTea: UIViewController {

  // MARK: - Properties
  private let filterViewControllerSegueIdentifier = "toFilterViewController"
  fileprivate let venueCellIdentifier = "VenueCell"

  var coreDataStack: TeaCoreDataStack!

  // MARK: - IBOutlets
  @IBOutlet weak var tableView: UITableView!

  // MARK: - View Life Cycle
  override func viewDidLoad() {
      super.viewDidLoad()
    
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
      }
      coreDataStack = appDelegate.dataAssist.coreDataStack
      appDelegate.dataAssist.importJSONSeedDataIfNeeded()
    
    
  }

  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == filterViewControllerSegueIdentifier {
      
    }
  }
}

// MARK: - IBActions
extension ViewControllerTea {

  @IBAction func unwindToVenueListViewController(_ segue: UIStoryboardSegue) {
  }
}

// MARK: - UITableViewDataSource
extension ViewControllerTea: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: venueCellIdentifier, for: indexPath)
    cell.textLabel?.text = "Bubble Tea Venue"
    cell.detailTextLabel?.text = "Price Info"
    return cell
  }
}
