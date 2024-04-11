//// # Everything about **Option** type.
////
//// A mix of functions and function alias found in the scala
//// ## Constructors:
////
//// ### Functions to create `Option` values:
////
//// * basic functions that are just wrappers for the
////   default type constructors:
////
////   - Creating `Some(a)`: `some(a)`, `apply(a)`, `pure(a)`
////   - Creating `None`: `none()`, `empty()`
////
//// * creating `Option` based on other parameters:
////
////   - Conditional creation: `when(condition, a)`
////
//// ### Manipulation of `Option` values:
////

import gleam/function.{identity}
import gleam/option.{type Option, None, Some}

/// Usually available in the `cats` library as an extension.
pub fn some(a) -> Option(a) {
  Some(a)
}

/// Usually available in the `cats` library as an extension.
pub fn none() -> Option(a) {
  None
}

/// Available in the scala standard library.
/// https://www.scala-lang.org/api/current/scala/Option$.html#apply-fffff801
pub fn apply(a) -> Option(a) {
  some(a)
}

/// Available in the scala standard library.
/// https://www.scala-lang.org/api/current/scala/Option$.html#empty-4ee
pub fn empty() -> Option(a) {
  none()
}

/// Matches the name for the `Applicative` type-class usually found in `cats` library.
pub fn pure(a) -> Option(a) {
  some(a)
}

/// Available in the scala standard library.
/// https://www.scala-lang.org/api/current/scala/Option$.html#when-a9e
pub fn when(condition: Bool, a) -> Option(a) {
  case condition {
    True -> some(a)
    False -> none()
  }
}

// Ignoring this one. Negatives are horrible to read in real code.
//pub fn unless

// basically the core function where all other fns can be buit upon
pub fn fold(o: Option(a), none_fn: fn() -> b, some_fn: fn(a) -> b) {
  case o {
    None -> none_fn()
    Some(a) -> some_fn(a)
  }
}

// dangerous.
// impure.
// explodes.
pub fn unsafe_get(o: Option(a)) -> a {
  o
  |> fold(fn() { panic }, identity)
}

pub fn exists(o: Option(a), p: fn(a) -> Bool) -> Bool {
  o
  |> fold(fn() { False }, p)
}

pub fn filter(o: Option(a), p: fn(a) -> Bool) -> Option(a) {
  case o {
    Some(a) ->
      case p(a) {
        True -> some(a)
        False -> none()
      }
    _ -> none()
  }
}
