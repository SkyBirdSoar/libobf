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
$-o[?+][b[_],[_m[4], ->_{[_[$-o[?_]],$-o[?.<<?.][$-o[?s<<??],_]]}]]
```

...and decoding
```ruby
$-o[?.][_,:reduce,$-o[?s],->_,__{_+(__[$-o[?_]]*__[$-o[?-]])}]
```

More examples are available in `examples/`

Tips and Tricks
---

## 1. Even and Odd

```ruby
number&1
```

If `number&1` is 0, it is even
If it is 1, it is odd.

It can be used like this:

```ruby
number&1<1?even:odd
```

## 2. Calling `$-o`
For 2 characters+ keys, there are different ways to call them.

```ruby
$-o[?.<<?.]
$-o['..']
$-o[%[..]] # and other %sym
$-o[%q[..]]
$-o[$-o[?s]+'..']
# etc
```

## 3. Obfuscating method calls
_libobf_ provides methods for you to obfuscate your method names!
Just fire up IRB and obfuscate your methods names!

```ruby
irb> require 'libobf'
  => true
irb> $-o[?[]["map"]
  => (obfuscated)
```
Copy and paste them into source and you are ready to go!

```ruby
m = [(obfuscated), (obfuscated), (obfuscated)]
Object.send($-o[?:][m[0]])
```

If you are lazy, you can also just `map(&:$-o[?:])` over `m`

## 4. More method calling obfuscation
Ruby allows us to call `[]` using the ol' way, so let's do it!

```ruby
$-o.[](?+).[](Kernel, [:puts, "hello"])
```

