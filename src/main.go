package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"time"
)

var Message = "it works!"

func hello(w http.ResponseWriter, r *http.Request) {
	log.Printf("[%s] %q", r.Method, r.URL.Path)
	fmt.Fprintf(w, `%s\n\n%s\n`, time.Now().Format(time.RFC1123Z), Message)
}

func main() {
	port := flag.String("port", "8000", "port to serve the content")
	flag.Parse()

	addr := ":" + *port
	log.Printf("serving content at %v", addr)

	http.HandleFunc("/", hello)
	if err := http.ListenAndServe(addr, nil); err != nil {
		log.Fatal(err)
	}
}
