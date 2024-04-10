# scala_stdlib

Bringing useful functions that exist in Scala to the Gleam language.

Scala is very similar language to Gleam and has a much more rich
amount of functions and data types in its standard library.

The effort here is 2 fold:
  - more functionality available in gleam;
  - make it easier to code in gleam coming from scala
    by making sure the same names and patterns known from that ecosystem
    exist here;

This is also an effort for me to play around and experiment with Gleam
by having a concrete objetive.

```gleam
import scala_stdlib

pub fn main() {
  let x = none() // Option.None
  let y: Option(Int) = some(1) // Option.Some(1)
  let w = empty() // Option.None
  let z: Option(Int) = when(True, 1) // Option.Some(1)
  let v = when(False, 1) // Option.None
}
```

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

## Progress

  - **Option**: started bringing some functions for Options.
    Also added some tests.

## TODO

  - Probrably separate into modules later, started with options and am putting everything flat;
  - Change license to more useful one if this goes anywhere;
  - ...