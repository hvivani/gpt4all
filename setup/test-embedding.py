#!/usr/bin/env python3

from gpt4all import GPT4All, Embed4All
text = 'The quick brown fox jumps over the lazy dog'
embedder = Embed4All()
output = embedder.embed(text)
print(output)
