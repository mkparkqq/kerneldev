#!/bin/bash

find . \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.S' -o -name '*.s' \) -print > cscope.files
cscope -i cscope.files
