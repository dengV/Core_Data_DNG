
import UIKit


//

import CoreData


class ViewControllerTea: UIViewController {

  // MARK: - Properties
  private let filterViewControllerSegueIdentifier = "toFilterViewController"
  fileprivate let venueCellIdentifier = "VenueCell"

  var coreDataStack: TeaCoreDataStack!
  
  var fetchRequest: NSFetchRequest<Venue>?
  
  var venues: [Venue] = []

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
    
      guard let model = coreDataStack.managedContext.persistentStoreCoordinator?.managedObjectModel, let fetchRequest = model.fetchRequestTemplate(forName: "FetchRequest") as? NSFetchRequest<Venue> else {
            return
      }
    //  NSFetchRequest
    
    
      self.fetchRequest = fetchRequest
      fetchAndReload()
    
  }

  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard segue.identifier == filterViewControllerSegueIdentifier, let navController = segue.destination as? UINavigationController, let filterVC = navController.topViewController as? FilterViewController else {
              return
      }
      filterVC.coreDataStack = coreDataStack
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
    return venues.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: venueCellIdentifier, for: indexPath)
    let venue = venues[indexPath.row]
    cell.textLabel?.text = venue.name
    cell.detailTextLabel?.text = venue.priceInfo?.priceCategory
    return cell
  }
}





extension ViewControllerTea{
  
    func fetchAndReload(){
        guard let fetchRequest = fetchRequest else {
            return
        }
        do {
            venues = try coreDataStack.managedContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print("Could Not fetch \(error), description: \(error.userInfo)")
        }
    }
}
