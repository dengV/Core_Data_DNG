## “The persistent store coordinator”



“NSPersistentStoreCoordinator is the bridge between the managed object model and the persistent store. It’s responsible for using the model and the persistent stores to do most of the hard work in Core Data. It understands the NSManagedObjectModel and knows how to send information to, and fetch information from, the NSPersistentStore.
NSPersistentStoreCoordinator also hides the implementation details of how your persistent store or stores are configured. This is useful for two reasons:
NSManagedObjectContext (coming next!) doesn’t have to know if it’s saving to an SQLite database, XML file or even a custom incremental store.
If you have multiple persistent stores, the persistent store coordinator presents a unified interface to the managed context. As far as the managed context is concerned, it always interacts with a single, aggregate persistent store.”

