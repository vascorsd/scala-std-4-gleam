import gleam/io
import gleam/option.{type Option, None, Some}

pub fn main() {
  io.println("Hello from scala_std!")
}

pub fn identity(a) -> a {
  a
}

/// Option
/// 
/// Constructors:
pub fn some(a) -> Option(a) {
  Some(a)
}

pub fn none() -> Option(a) {
  None
}

pub fn empty() -> Option(a) {
  none()
}

pub fn when(condition: Bool, a) -> Option(a) {
  case condition {
    True -> some(a)
    False -> none()
  }
}

// explicitly not bringing "unless" method since negatives are weird to read.

// basically the core function where all other fns can be buit upon
pub fn fold(o: Option(a), none_fn: fn() -> b, some_fn: fn(a) -> b) {
  case o {
    None -> none_fn()
    Some(a) -> some_fn(a)
  }
}

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
