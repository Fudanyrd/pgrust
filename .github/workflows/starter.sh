#!/usr/bin/env bash

# README > run pgrust
set -e
mkdir -p /tmp/pgrust-data

./target/release/postgres --initdb \
  -D /tmp/pgrust-data \
  -L "$PWD/vendor/postgres-18.3/share" \
  --no-locale \
  --encoding UTF8 \
  -U postgres

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
