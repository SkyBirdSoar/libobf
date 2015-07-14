__END__
public_send       .  = -> object, *args, &block { object.public_send *args, &block }
send              .! = -> object, *args, &block { object.send *args, &block }
proc_call         .. = -> proc, *args, &block { proc.call *args, &block }
chain_send        + = -> object, *methods { methods.reduce(object) { |object, method| method.is_a?(Array?) ? object.send(method.shift, *method) : object.send(method)}}
join_array        $  = -> array, join_str='' { array.join join_str }
length_str        s? = -> string { string.length }
length_any        ?  = -> object { object.length }
0                 _  = 0
1                 -  = 1
square_root       2  = -> num { num ** (1/2r) }
cube_root         3  = -> num { num ** (1/3r) }
0.0               _f = 0.0
Infinity          i  = Infinity
NaN               N  = NaN
Super Infinity    i' = (Infinity+Infinity*i)
Super NaN         N' = (NaN+NaN*i)
String#ord        o  = -> string { string.ord }
Fixnum#chr        c  = -> fixnum { fixnum.chr }
empty_string      s  = ''
Obfuscate#obscure [  = -> string { Obfuscate.obscure string }
Obfuscate#reverse :  = -> <obscured> { Obfuscate.reverse <obscured> }
Obfuscate#encode  e  = -> string { Obfuscate.encode string }
Obfuscate#decode  d  = -> <encoded> { Obfuscate.decode <encoded> }