package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"

	shell "github.com/ipfs/go-ipfs-api"
)

func main() {
	sh := shell.NewLocalShell()
	cid, err := sh.Add(strings.NewReader("hello world!"))
	if err != nil {
		fmt.Fprintln(os.Stderr, "error: ", err)
		os.Exit(1)
	}
	fmt.Fprintln(os.Stdout, "added : ", cid)

	readCloser, err := sh.Cat(cid)
	if err != nil {
		fmt.Fprintln(os.Stderr, "error: ", err)
		os.Exit(1)
	}
	outputByts, err := ioutil.ReadAll(readCloser)
	if err != nil {
		fmt.Fprintln(os.Stderr, "error: ", err)
		os.Exit(1)
	}
	fmt.Fprintln(os.Stdout, "data from cid : ", string(outputByts))
}
