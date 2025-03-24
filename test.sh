#!/bin/bash

gcc -o Lab1 Lab1.c || { echo "Compilation failed"; exit 1; }

test_cases=(
    "Hello world:2"
    "  Leading spaces:2"
    "Trailing spaces   :2"
    "Multiple   spaces between words:4"
    ":0"
    "OneWord:1"
    "Numbers 123 and words:3"
)

for test in "${test_cases[@]}"; do
    input="${test%%:*}"
    expected="${test##*:}"
    result=$(echo -n "$input" | ./Lab1 | grep -oE '[0-9]+')
    
    if [[ "$result" -eq "$expected" ]]; then
        echo "Test passed: '$input' -> $result"
    else
        echo "Test failed: '$input' -> $result (expected $expected)"
        exit 1
    fi
done

echo "All tests passed!"
