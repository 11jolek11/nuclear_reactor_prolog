get_char(Result) :- 
  get(Char),              % read a character
  get0(_),                % consume the Return after it
 char_code(Result,Char),
 !.  

 interpret(65,a).  % ASCII 89  = 'Y'
 interpret(97,a). % ASCII 121 = 'y'
 interpret(66,b).   % ASCII 78  = 'N'
 interpret(98,b).  % ASCII 110 = 'n'