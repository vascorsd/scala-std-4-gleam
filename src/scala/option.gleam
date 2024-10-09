//// `Option` type and its operations.
////
//// Common operations found in scala std or
//// the common libraries that enhance scala DX.
////
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

import gleam/option.{type Option, None, Some}

// Construction ----

pub fn apply(a) -> Option(a) {
  Some(a)
}

pub fn empty() -> Option(a) {
  None
}

pub fn some(a) -> Option(a) {
  Some(a)
}

pub fn none() -> Option(a) {
  None
}

pub fn pure(a) -> Option(a) {
  Some(a)
}

pub fn when(cond: Bool, a) -> Option(a) {
  case cond {
    True -> some(a)
    False -> none()
  }
}

pub fn when_lazy(cond: Bool, a fun: fn() -> a) -> Option(a) {
  case cond {
    True -> some(fun())
    False -> none()
  }
}

// Manipulation ----

pub fn fold(o: Option(a), if_empty: fn() -> b, f: fn(a) -> b) -> b {
  case o {
    None -> if_empty()
    Some(a) -> f(a)
  }
}

pub fn flat_map(o: Option(a), f: fn(a) -> Option(b)) -> Option(b) {
  option.then(o, f)
}

pub fn map(o: Option(a), f: fn(a) -> b) -> Option(b) {
  option.map(o, f)
}

pub fn flatten(o: Option(Option(a))) -> Option(a) {
  option.flatten(o)
}

pub fn filter(o: Option(a), p: fn(a) -> Bool) -> Option(a) {
  o |> flat_map(fn(a) { when(p(a), a) })
}

pub fn exists(o: Option(a), p: fn(a) -> Bool) -> Bool {
  case o {
    Some(a) -> p(a)
    None -> False
  }
}

pub fn is_defined(o: Option(a)) -> Bool {
  o |> exists(fn(_) { True })
}

pub fn non_empty(o: Option(a)) -> Bool {
  is_defined(o)
}

pub fn is_empty(o: Option(a)) -> Bool {
  !non_empty(o)
}

pub fn contains(o: Option(a), elem: a) -> Bool {
  o |> exists(fn(a) { a == elem })
}

pub fn get_or_else(o: Option(a), default: fn() -> a) -> a {
  case o {
    Some(a) -> a
    None -> default()
  }
}

pub fn or_else(o: Option(a), alternative: fn() -> Option(a)) -> Option(a) {
  case o {
    Some(a) -> Some(a)
    None -> alternative()
  }
}

pub fn zip(o: Option(a), that: Option(b)) -> Option(#(a, b)) {
  case o, that {
    Some(a), Some(b) -> Some(#(a, b))
    _, _ -> None
  }
}

pub fn to_list(o: Option(a)) -> List(a) {
  case o {
    Some(a) -> [a]
    None -> []
  }
}

// Unsafe zone ----

pub fn for_each(o: Option(a), f: fn(a) -> b) -> Nil {
  o |> map(f)

  Nil
}

pub fn unsafe_get(o: Option(a)) -> a {
  case o {
    Some(a) -> a
    None -> panic
  }
}
