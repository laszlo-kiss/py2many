# py2many: Python to many CLike languages transpiler

![Build](https://github.com/adsharma/py2many/actions/workflows/main.yml/badge.svg)
![License](https://img.shields.io/github/license/adsharma/py2many?color=brightgreen)

## Why

Python is popular, easy to program in, but has poor runtime
performance. We can fix that by transpiling a subset of the language
into a more performant, statically typed language.

A second benefit is security. Writing security sensitive
code in a low level language like C is error prone and could
lead to privilege escalation. Specialized languages such as
[wuffs](https://github.com/google/wuffs) exist to address this use
case. py2many can be a more general purpose solution to the problem
where you can verify the source via unit tests before you transpile.

A third potential use case is to accelerate python code by transpiling
it into an [extension](https://github.com/adsharma/py2many/issues/62)

Swift and Kotlin dominate the mobile app development workflow. However, there is
no one solution that works well for lower level libraries where there is desire
to share code between platforms. Kotlin Mobile Multiplatform (KMM) is a player
in this place, but it hasn't really caught on. py2many provides an alternative.

Lastly, it's a great educational tool to learn a new language by implementing
a backend for your favorite language.

## Status

Rust is the language where the focus of development has been. C++14 is historically
the first language to be supported.

Preliminary support exists for Julia, Kotlin, Nim, Go and Dart.

## History

Based on Julian Konchunas' pyrs
http://github.com/konchunas/pyrs

Based on Lukas Martinelli Py14
(https://github.com/lukasmartinelli/py14) and Py14/python-3
(https://github.com/ProgVal/py14/tree/python-3) branch by Valentin
Lorentz.

## Example

Original Python version.

```python
def fib(i: int) -> int:
    if i == 0 or i == 1:
        return 1
    return fib(i - 1) + fib(i - 2)
```

Transpiled Rust code:

```rust
fn fib(i: i32) -> i32 {
    if i == 0 || i == 1 {
        return 1;
    }
    return (fib((i - 1)) + fib((i - 2)));
}
```

Transpiled code for other languages:

https://github.com/adsharma/py2many/tree/main/tests/expected (fib*)


## Trying it out

Requirements:
- python 3
- clang
- rustc

Local installation:

```
./setup.py install --user  # installs to $HOME/.local
```

OR

```
sudo ./setup.py install  # installs systemwide
```

Add the py2many script to your $PATH and run:

Transpiling:

```
py2many --cpp=1 /tmp/fib.py
py2many --rust=1 /tmp/fib.py
py2many --julia=1 /tmp/fib.py
py2many --kotlin=1 /tmp/fib.py
py2many --nim=1 /tmp/fib.py
py2many --dart=1 /tmp/fib.py
py2many --go=1 /tmp/fib.py
```

Compiling:

```
clang fib.cpp
rustc fib.rs
...
```

