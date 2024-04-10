import gleeunit
import gleeunit/should
import gleam/option.{None, Some}
import scala_stdlib as s

pub fn main() {
  gleeunit.main()
}

pub fn option_none1_test() {
  s.none()
  |> should.equal(None)
}

pub fn option_some_test() {
  s.some("x")
  |> should.equal(Some("x"))
}

pub fn option_empty_test() {
  s.empty()
  |> should.equal(None)
}

pub fn option_when_true_test() {
  s.when(True, "x")
  |> should.equal(Some("x"))
}

pub fn option_when_false_test() {
  s.when(False, 1)
  |> should.equal(None)
}

pub fn option_fold1_test() {
  s.fold(None, fn() { "none" }, fn(_) { "some" })
  |> should.equal("none")
}

pub fn option_fold2_test() {
  s.fold(Some(0), fn() { "none" }, fn(_) { "some" })
  |> should.equal("some")
}

pub fn option_fold3_test() {
  s.fold(Some(1), fn() { 0 }, fn(v) { v + 5 })
  |> should.equal(6)
}

pub fn option_get1_test() {
  s.unsafe_get(Some(0))
  |> should.equal(0)
}

// is there a way to test that something panics in gleam ??
//pub fn option_get2_test() {
//  s.unsafe_get(None)
//  |> should.equal(0)
//}

pub fn option_exists1_test() {
  s.exists(None, fn(_) { True })
  |> should.equal(False)
}

pub fn option_exists2_test() {
  s.exists(Some(1), fn(_) { True })
  |> should.equal(True)
}

pub fn option_exists3_test() {
  Some("x")
  |> s.exists(fn(v) {
    case v {
      "x" -> True
      _ -> False
    }
  })
  |> should.equal(True)
}

pub fn option_exists4_test() {
  Some("x")
  |> s.exists(fn(v) {
    case v {
      "x" -> False
      _ -> True
    }
  })
  |> should.equal(False)
}

pub fn option_filter1_test() {
  None
  |> s.filter(fn(v) {
    case v {
      "x" -> True
      _ -> False
    }
  })
  |> should.equal(None)
}

pub fn option_filter2_test() {
  Some("x")
  |> s.filter(fn(v) {
    case v {
      "x" -> True
      _ -> False
    }
  })
  |> should.equal(Some("x"))
}

pub fn option_filter3_test() {
  Some("y")
  |> s.filter(fn(v) {
    case v {
      "x" -> True
      _ -> False
    }
  })
  |> should.equal(None)
}
