#!/bin/bash

gcc -o count_words count_words.c || { echo "Compilation failed"; exit 1; }

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
    result=$(echo -n "$input" | ./count_words)
    
    if [[ "$result" -eq "$expected" ]]; then
        echo "Test passed: '$input' -> $result"
    else
        echo "Test failed: '$input' -> $result (expected $expected)"
        exit 1
    fi
done

echo "All tests passed!"
