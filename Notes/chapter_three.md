## The persistent store


NSPersistentStore reads and writes data to whichever storage method you’ve decided to use. Core Data provides four types of NSPersistentStore out of the box: three atomic and one non-atomic.
An atomic persistent store needs to be completely deserialized and loaded into memory before you can make any read or write operations. In contrast, a non-atomic persistent store can load chunks of itself onto memory as needed.



Here’s a brief overview of the four built-in Core Data store types:



NSQLiteStoreType is backed by an SQLite database. It’s the only non-atomic store type Core Data supports out of the box, giving it a lightweight and efficient memory footprint. This makes it the best choice for most iOS projects. Xcode’s Core Data template uses this store type by default.



NSXMLStoreType is backed by an XML file, making it the most human-readable of all the store types. This store type is atomic, so it can have a large memory footprint. NSXMLStoreType is only available on OS X.




NSBinaryStoreType is backed by a binary data file. Like NSXMLStoreType, it’s also an atomic store, so the entire binary file must be loaded onto memory before you can do anything with it. You’ll rarely find this type of persistent store in real-world applications.



NSInMemoryStoreType is the in-memory persistent store type. In a way, this store type is not really persistent. Terminate the app or turn off your phone, and the data stored in an in-memory store type disappears into thin air. Although this may seem to defeat the purpose of Core Data, in-memory persistent stores can be helpful for unit testing and some types of caching.






> Note: Were you holding your breath for a persistent store type backed by a JSON file or a CSV file? Bummer. The good news is you can create your own type of persistent store by subclassing NSIncrementalStore.
Refer to Apple’s Incremental Store Programming Guide if you’re curious about this option:
https://developer.apple.com/library/ios/documentation/DataManagement/Conceptual/IncrementalStorePG/Introduction/Introduction.html”


