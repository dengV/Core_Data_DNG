

First, you fetch all Dog entities with names of "Fido" from Core Data. You’ll learn more about fancy fetch requests like this in the next chapter. If the fetch request came back with results, you set the first entity (there should only be one) as the currently selected dog. If the fetch request comes back with zero results, this probably means it’s the user’s first time opening the app. If this is the case, you insert a new dog, name it “Fido”, and set it as the currently selected dog.



Note: You’ve just implemented what’s often referred to as <b>the Find or Create pattern</b>. The purpose of this pattern is to manipulate an object stored in Core Data without running the risk of adding a duplicate in the process.



In iOS 9, Apple introduced the ability to specify unique constraints on your Core Data entities. With unique constraints, you can specify in your data model which attributes must always be unique on an entity to avoid adding duplicates.