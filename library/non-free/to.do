(need to fix KNext to not have those errors
 (here's is the deal with knext
  (deal with a NIL)
  (can't have \( or \))
  (\[ or \])
  (no ?)
  (no \")
  (no !)
  (sometimes there is just a space)
  )
 )

/var/lib/myfrdcsa/codebases/minor/free-knext/knext.pl -d  --no-formalize -s "every few sentences" -f sample-knext-input.txt

(improve extractor to handle all sources)

(fix it to prioritize the first wikihow search response when processing with KNext)

(fix it to use it's own Sayer database for safety)

(do property inflection changes instead of our sample one, from plural to singular)


(There's no such thing as stupid AIs, only bad programmers.)

(extract if, when, then type statements and try to develop rules automatically by using the knext result for these
 (verify KNext memoizes individually)
 )

