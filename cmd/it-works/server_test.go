package main

import (
	"io/ioutil"
	"net/http/httptest"
	"testing"
)

func TestHello(t *testing.T) {
	req := httptest.NewRequest("GET", "/", nil)
	w := httptest.NewRecorder()

	hello(w, req)

	resp := w.Result()
	body, _ := ioutil.ReadAll(resp.Body)

	if len(body) <= 0 {
		t.Fatal(t, "body null")
	}
}
