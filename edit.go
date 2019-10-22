// Copyright 2011 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

import (
	"html/template"
	"net/http"
	"runtime"
	"strings"
)

var editTemplate = template.Must(template.ParseFiles("edit.html"))

type editData struct {
	Snippet   *snippet
	Share     bool
	Analytics bool
	GoVersion string
}

func (s *server) handleEdit(w http.ResponseWriter, r *http.Request) {
	// Serve 404 for /foo.
	if r.URL.Path != "/" && !strings.HasPrefix(r.URL.Path, "/p/") {
		http.NotFound(w, r)
		return
	}

	snip := &snippet{Body: []byte(hello)}
	w.Header().Set("Content-Type", "text/html; charset=utf-8")
	data := &editData{
		Snippet:   snip,
		Share:     false,
		Analytics: false,
		GoVersion: runtime.Version(),
	}
	if err := editTemplate.Execute(w, data); err != nil {
		s.log.Errorf("editTemplate.Execute(w, %+v): %v", data, err)
		return
	}
}

const hello = `#!/bin/bash

echo "hello"
`
