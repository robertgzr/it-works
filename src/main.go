package main

import (
	"flag"
	"io"
	"log"
	"net/http"
	"time"
)

const defaultMsg = "it works!"

var (
	port string
	msg  string
)

func init() {
	flag.StringVar(&port, "port", "8000", "port to serve the content")
	flag.StringVar(&msg, "msg", defaultMsg, "message to respond with")
}

func hello(w http.ResponseWriter, r *http.Request) {
	log.Printf("[%s] %q", r.Method, r.URL.Path)
	io.WriteString(w, time.Now().Format(time.RFC1123Z))
	io.WriteString(w, "\n\n")
	io.WriteString(w, msg)
	io.WriteString(w, "\n")
}

func main() {
	flag.Parse()

	http.HandleFunc("/", hello)

	addr := ":" + port
	log.Printf("serving content at %v", addr)

	http.ListenAndServe(addr, nil)
}
