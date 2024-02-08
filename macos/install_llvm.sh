#!/bin/bash

brew install llvm

sudo ln -s "$(brew --prefix llvm)/bin/clang-format" "/usr/local/bin/clang-format"
sudo ln -s "$(brew --prefix llvm)/bin/clang-tidy" "/usr/local/bin/clang-tidy"
sudo ln -s "$(brew --prefix llvm)/bin/clang-apply-replacements" "/usr/local/bin/clang-apply-replacements"
