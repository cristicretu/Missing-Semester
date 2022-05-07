#!/usr/bin/env bash

find . -type f -name "*.html" | xargs tar -cvzf zip.tar.gz
