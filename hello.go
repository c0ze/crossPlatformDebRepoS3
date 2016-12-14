package main

import (
	"flag"
	"fmt"
	"os"
)

func main() {
	versionFlag := flag.Bool("v", false, "display version")
	flag.Parse()

	if *versionFlag {
		fmt.Println(VERSION)
		os.Exit(0)
	}
	fmt.Println("Hello World!")
}
