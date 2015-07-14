# libobf
Forcing Weak Obfuscation Onto Developers™

libobf encourages and supports the use of non-alphanumeric letters to
obfuscate code.

`Note`: Your code is difficult to read, but very easy to deobfuscate.

Examples
---

*Example*: Run-length encoding
```ruby
_m = %i[to_s partition empty? unshift map]
_=$-o[?.][_,_m[0]]
a =->_{$-o[?.][_,_m[1],%r{(.)\1{0,}}]}
b =->_{$-o[?.][_,_m[2]]? []:(_=a[_];$-o[?.][b[_[$-o[?-]+$-o[?-]]],_m[3],_[$-o[?-]]])}
c =->_{_=~%r'$'}
$-o[?+][b[_],[_m[4], ->_{[_[$-o[?_]],$-o[?.<<?.][c,_]]}]]
```

...and decoding
```ruby
$-o[?.][_,:reduce,$-o[?s],->_,__{_+(__[$-o[?_]]*__[$-o[?-]])}]
```

More examples are available in `examples/`