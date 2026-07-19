#!/usr/bin/env bash

# README > run pgrust

ulimit -s 65520

RUST_MIN_STACK=33554432 exec \
  ./target/release/postgres \
  -D /tmp/pgrust-data \
  -F \
  -c listen_addresses= \
  -k /tmp \
  -p 5432 \
  -c io_method=sync \
  -c max_stack_depth=60000
