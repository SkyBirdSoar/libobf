=begin
  Copyright 2015 SkyBirdSoar

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
=end

Obfuscate = {} # The root of all evil
-> { # No Namespace Pollution
  _m = %i[call length ord chr reduce]

  Obfuscate[?.] = ->_,*__,&___{____=__.shift;___=__.pop if (!block_given? and __.last.to_proc rescue false);_.public_send ____, *__, &___}
  Obfuscate[?.<<?!] = ->_,*__,&___{____=__.shift;___=__.pop if (!block_given? and __.last.to_proc rescue false);_.send ____, *__, &___}
  Obfuscate[?.<<?.] = ->_,*__,&___{Obfuscate[?.][_,_m[0],*__,&___]}
  Obfuscate[?+] = ->_,*__{Obfuscate[?.].(__,_m[4],_){|_,__|__.is_a?(Array) ? (Obfuscate[?.][_,__.shift,*__]):Obfuscate[?.][_,__]}}
  Obfuscate[?$] = ->_,__=''{_*__}
  Obfuscate[?s<<??] = ->_{_=~/$/}
  Obfuscate[??] = ->_{Obfuscate[?.][_,_m[1]]}
  Obfuscate[?_] = ($$-$$).freeze
  Obfuscate[?-] = ($$/$$).freeze
  Obfuscate[?2] = ->_{_**((Obfuscate[?-]+Obfuscate[?-])**(-Obfuscate[?-]))}
  Obfuscate[?3] = ->_{_**((Obfuscate[?-]+Obfuscate[?-]+Obfuscate[?-])**(-Obfuscate[?-]))}
  Obfuscate[?_<<?f] = Obfuscate[?3][Obfuscate[?-]+Obfuscate[?-]]-Obfuscate[?3][Obfuscate[?-]+Obfuscate[?-]]
  Obfuscate[?i] = (Obfuscate[?-]/Obfuscate[?_<<?f]).freeze
  Obfuscate[?N] = (Obfuscate[?_<<?f]/Obfuscate[?_<<?f]).freeze
  Obfuscate[?i<<?'] = (Obfuscate[?2][-Obfuscate[?i]-Obfuscate[?i]]).freeze
  Obfuscate[?N<<?'] = (Obfuscate[?-]/(Obfuscate[?2][-Obfuscate[?-]]-Obfuscate[?2][-Obfuscate[?-]])).freeze
  Obfuscate[?o] = ->_{Obfuscate[?.][_,_m[2]]}
  Obfuscate[?c] = ->_{Obfuscate[?.][_,_m[3]]}
  Obfuscate[?s] = ''.freeze
}.call()

def Obfuscate.methods
  Obfuscate.keys
end

def Obfuscate.encode _
  _m = %i[to_s partition empty? unshift map]
  _=Obfuscate[?.][_,_m[0]]
  a =->_{Obfuscate[?.][_,_m[1],%r{(.)\1{0,}}]}
  b =->_{Obfuscate[?.][_,_m[2]]? []:(_=a[_];Obfuscate[?.][b[_[Obfuscate[?-]+Obfuscate[?-]]],_m[3],_[Obfuscate[?-]]])}
  Obfuscate[?+][b[_],[_m[4], ->_{[_[Obfuscate[?_]],Obfuscate[?.<<?.][Obfuscate[?s>>??],_]]}]]
end

def Obfuscate.decode _
  Obfuscate[?.][_,:reduce,Obfuscate[?s],->_,__{_+(__[Obfuscate[?_]]*__[Obfuscate[?-]])}]
end

def Obfuscate.obscure _
  _=Obfuscate[?+][_,:to_s,:chars,[:map,->_{Obfuscate[?.][Obfuscate,:encode,Obfuscate[?o][_]]}]]
end

def Obfuscate.reverse _
  a=->_,__{_+Obfuscate[?c][Obfuscate[?+][Obfuscate,[:decode,__],:to_i]]}
  _=Obfuscate[?+][_,[:reduce,Obfuscate[?s],a],:intern]
end

-> {
  Obfuscate[?[]=->_{Obfuscate[?.][Obfuscate,:obscure,_]}
  Obfuscate[?:]=->_{Obfuscate[?.][Obfuscate,:reverse,_]}
  Obfuscate[?e]=->_{Obfuscate[?.][Obfuscate,:encode,_]}
  Obfuscate[?d]=->_{Obfuscate[?.][Obfuscate,:decode,_]}
}.call()

$© = Obfuscate
alias $-o $©