//// The purpose of this library is to ease the usage
//// of Gleam language for current/former Scala language users.
////
//// To do so we expose various functions that are equal, similar
//// or close enough to the names and patterns usually found in
//// that ecosystem.
////
//// It's opinionated in the sense that some functions will simply
//// not be here if we don't like them enough ^^.
////
//// Functions will come from the following places:
////
////   - scala standard library - https://scala-lang.org/api/3.3_LTS/
////   - cats and it's ecosystem - https://typelevel.org/cats/
////   - other patterns or common usages in the community -
////     for example avoiding functions with side effects and in case
////     of bringing them use the common pattern for `unsafe` for certain
////     use cases.
////
//// It's also an exercise to see how much can be done in gleam.
//// Implementations come from reading the official docs and trying to
//// match code to the functions described there.
////
//// Overall in the process we will create a more powerful set of functions
//// and modules that can enhance the current gleam standard library
//// which is a good thing for everyone :)

