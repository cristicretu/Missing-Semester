#!/usr/bin/env bash

marco() {
    export Marco=$(pwd)
}

polo() {
    cd $Marco
    echo $Marco
}
