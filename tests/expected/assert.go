package main

import (
	"fmt"
)

func compare_assert(a int, b int) {
	if !(a == b) {
		panic("assert")
	}
	if !(!(0 == 1)) {
		panic("assert")
	}
}

func main() {
	if !(true) {
		panic("assert")
	}
	if !(!(false)) {
		panic("assert")
	}
	compare_assert(1, 1)
	if !(true) {
		panic("assert")
	}
	if !(true) {
		panic("assert")
	}
	fmt.Printf("%v\n", "OK")
}
