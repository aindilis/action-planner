(defglobal ?*host* = "127.0.0.1")
(defglobal ?*servlet* = "JessServlet")
(defglobal ?*homepage* = (str-cat "<p><a href=\"http://" ?*host* "/sylee/courses/jess/projects/com/com.htm\">�өʤ��R�t��</a>"))

(deffunction read-from-web (?prompt ?factName)
   (printout t ?prompt)
   ;(printout t (toUnicode ?prompt))
   (printout t "<FORM METHOD=POST ACTION=http://" ?*host* "/servlets/" ?*servlet* ">")
   (printout t "<INPUT TYPE=\"hidden\" NAME=\"fileRB\" VALUE=\"com\">")
   (printout t "<INPUT TYPE=\"hidden\" NAME=\"fact_name\" VALUE=" ?factName ">")
   (printout t crlf "<INPUT TYPE=\"radio\" NAME=\"slot\" VALUE=\"n\" checked>no")
   (printout t "<INPUT TYPE=\"radio\" NAME=\"slot\" VALUE=\"y\" >yes")
   ;(printout t crlf crlf "<p>Debug mode?<INPUT TYPE=\"radio\" NAME=\"debug\" VALUE=\"no\" checked>no")
   ;(printout t "<INPUT TYPE=\"radio\" NAME=\"debug\" VALUE=\"yes\" >yes")
   (printout t crlf crlf "<p><INPUT TYPE=submit VALUE=\"Enter\">")
   (printout t "</FORM>")
   )

;(defrule welcome
;=> 
; (printout t (toUnicode "�w����{ * * �өʤ��R�t�� * *") crlf)
; (printout t " " crlf)
; (read-from-web "�n�}�l��(y/n)? " welcome))
 
;(defrule w-y
; (welcome y)
;=>
; (printout t " " crlf)
; (printout t (toUnicode "* * ���A�����r�� * *") crlf)
; (printout t " " crlf)
; (read-from-web "�п��D��(one,two,three) : " w-y))


;(defrule w-n
;(welcome n)
;=>
; (printout t " " crlf)
; (printout t (toUnicode "* * �w��U���A�� * *") crlf))
 
 
(defrule one
 (w-y one)
 => 
 (read-from-web "��ܪ��O�u��Ѧۤv���өʡv�߲z����(y/n)? " one))

(defrule one-n
(one n)
 =>
 (printout t "�����A�����F" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule one-y
(one y)
 =>
 (printout t " " crlf)
 (read-from-web "���D�@�D�A�{���A�O�@�Ӧ��өʡA���ۤv����Q�ΥD�����H�ܡH(y/n)" gquestion1))
 
(defrule gquestion1-y
 (gquestion1 y)
 =>
 (read-from-web "���D�G�D�A�����w�P���٬O�ߧΪ�����O�H (y=�P��/n=�ߧ�)" gquestion2))
 
(defrule gquestion2-y
 (gquestion2 y)
 =>
 (read-from-web "���D�T�D�A���w���v�����ξ���H�ܡH(y/n)" gquestion3))
 
(defrule gquestion3-y
 (gquestion3 y)
 =>
 (read-from-web "���D�Q�@�D�A�O�_���@�Ӧ��d���ߪ��ǥͩ�¾���O�H(y/n)" gquestion11))
 
(defrule gquestion11-y
 (gquestion11 y)
 =>
 (read-from-web "���D���D�A�����d�̦����⪺��A�ܡH(y/n)" gquestion5))
 
(defrule gquestion5-y
 (gquestion5 y)
 =>
 (read-from-web "���D���D�A�@�N�ӽФ@���ݭn�u�@�g�窺¾��ܡH(y/n)" gquestion6))
 
(defrule gquestion6-y
 (gquestion6 y)
 =>
 (read-from-web "���D�C�D�A����B�ͪ��w��A�O�_�]���A�O�@�ӥi�a���H�O�H(y/n)" gquestion7))
  
(defrule gquestion7-y
  (gquestion7 y)
=>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t  "A���G��¥~�V��" crlf) 
 (printout t  "     �A�O�@�ӥ~�V�M���[���H�C���M�A�]�����饢��" crlf)
 (printout t  "     ���ɫJ�A���}�Ԫ��A�ܧ֫K�|���@�_�ӡC���ʪB" crlf)
 (printout t  "     �ͫܳ��w�A�ˤ��͵����ʮ�A���]�P�ɥO�A���t" crlf)
 (printout t  "     �����h�w���P�C������F�P���O�A�����I�A���e" crlf)
 (printout t  "     �e�B�j�q�κB�n�O�A���w�諸��]�C�P�ʪB�ͫ�" crlf)
 (printout t  "     ���F�ѧA�A�]���A�ʮ�ѯu��¡A���o���O�A�l" crlf)
 (printout t  "     �޲��ʪ����Q����O�I" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
 (defrule gquestion1-n
  (gquestion1 n)
  =>
  (read-from-web "���D�K�D�A�O�u�Y�v���ܡH(y/n)" gquestion8))
  
  (defrule gquestion8-y
  (gquestion8 y)
  =>
  (read-from-web "���D�G�D�A�����w�P���٬O�ߧΪ�����O�H (Y=�P��/N=�ߧ�)" gquestion2))
 
 (defrule gquestion2-n
 (gquestion2 n)
 =>
 (read-from-web "���D�E�D�A�O�_ı�o�A�����⤣���մ��O�H(y/n)" gquestion9))
  
  (defrule gquestion9-y
  (gquestion9 y)
  =>
  (read-from-web "���D�T�D�A���w���v�����ξ���H�ܡH(y/n)" gquestion3))
 
 (defrule gquestion3-n
 (gquestion3 n)
 =>
 (read-from-web "���D�|�D�A�襤�ꪺ�ǲΪA��������ܡH(y/n)" gquestion4))
  
  (defrule gquestion4-n
  (gquestion4 n)
  =>
  (read-from-web "���D���D�A�����d�̦����⪺��A�ܡH(y/n)" gquestion5))
 
(defrule gquestion5-n
 (gquestion5 n)

 =>
(read-from-web "���D�Q�G�D�A�̪���u��������ܡH(y/n)" gquestion12))
 
(defrule question12-y
 (gquestion12 y)
=>
(read-from-web "���D�Q�K�D�A�����w�s�٬O���v�O�H(Y=�s/N=���v)" gquestion18))
 
 (defrule gquestion18-n
 (question18 n)
 =>
 (read-from-web "���D�G�Q���D�A�郎�p����(Internet)������ܡH(y/n)" gquestion25))
  
  (defrule question25-y
  (gquestion25 y)
  =>
  (read-from-web "���D�Q�E�D�A�|���Ҥ�A�X�⪺�H�ܡH(y/n)" gquestion19))
 
(defrule gquestion19-y
 (gquestion19 y)
 =>
 (read-from-web "���D�Q�|�D�A���N�P�@�s���ʪB�ͺΦb�ۦP���@�i�ɶܡH(y/n)" gquestion14))
 
(defrule gquestion14-y
 (gquestion14 y)
 =>
(read-from-web "���D�G�Q�D�A���N�b�������Ҥj���Τj�n�͸ܶܡH(y/n)" gquestion20))
 
(defrule gquestion20-n
 (gquestion20 n)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B���G���N�a��" crlf) 
 (printout t "     �A���h�Ӯƪ��ʮ��`�O�O�B�ͭ�ı�o�A�O�L�̪�" crlf)
 (printout t "     �j����/�j�j�j�C�B�� �̳��ܫH���A�F�L��ı�o" crlf)
 (printout t "     �P�A��ѫܵΪA�åB�O�@�ؼֽ�C�q�`�@�Ǧ~ "  crlf)
 (printout t "     ����A�p�ӥB�P���ܮz�����ʳ��|���A�l�ޡC"   crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

 (defrule gquestion2-n
 (gquestion2 n)
 =>
 (read-from-web "���D�E�D�A�O�_ı�o�A�����⤣���մ��O�H(y/n)" gquestion9))
  
  (defrule gquestion9-n
  (gquestion9 n)
  =>
  (read-from-web "���D�Q���D�A��z�즳����ܡH" gquestion16))
 
;(defrule question16-y
 ;(gquestion16 y)
 ;=>
;(read-from-web "���D�Q�D�бq�U�C��تᤤ��ܧA�����w���@�ءG(Y=�V�鸪/N=�����)" gquestion10))
 
 (defrule gquestion10-y
 (gquestion10 y)
 =>
 (read-from-web "���D�Q�|�D�A���N�P�@�s���ʪB�ͺΦb�ۦP���@�i�ɶܡH(y/n)" gquestion14))
 
 (defrule gquestion14-n
 (gquestion14 n)
=>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "A���G��¥~�V��" crlf) 
 (printout t "     �A�O�@�ӥ~�V�M���[���H�C���M�A�]�����饢��" crlf)
 (printout t "     ���ɫJ�A���}�Ԫ��A�ܧ֫K�|���@�_�ӡC���ʪB" crlf)
 (printout t "     �ͫܳ��w�A�ˤ��͵����ʮ�A���]�P�ɥO�A���t" crlf)
 (printout t "     �����h�w���P�C������F�P���O�A�����I�A���e" crlf)
 (printout t "     �e�B�j�q�κB�n�O�A���w�諸��]�C�P�ʪB�ͫ�" crlf)
 (printout t "     ���F�ѧA�A�]���A�ʮ�ѯu��¡A���o���O�A�l" crlf)
 (printout t "     �޲��ʪ����Q����O�I" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion6-n
 (gquestion6 n)
 =>
(read-from-web "���D�Q�T�D�A�{���A�O�@�ӿˤ��͵����H�ܡH" gquestion13))
 
 (defrule gquestion13-y
 (gquestion13 y)
 =>
 (read-from-web "���D�C�D�A����B�ͪ��w��A�O�_�]���A�O�@�ӥi�a���H�O�H(y/n)" gquestion7))
 
 (defrule gquestion7-n
  (gquestion7 n)
=>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B���G���N�a��" crlf) 
 (printout t "     �A���h�Ӯƪ��ʮ��`�O�O�B�ͭ�ı�o�A�O�L�̪�" crlf)
 (printout t "     �j����/�j�j�j�C�B�� �̳��ܫH���A�F�L��ı�o" crlf)
 (printout t "     �P�A��ѫܵΪA�åB�O�@�ؼֽ�C�q�`�@�Ǧ~ "  crlf)
 (printout t "     ����A�p�ӥB�P���ܮz�����ʳ��|���A�l�ޡC"   crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

 (defrule gquestion8-n
  (gquestion8 n)
  =>
  (read-from-web "���D�Q���D�B�ʬO�_�A�D�n���~/�Ҿl���ʩO�H(y/n)" gquestion15))
 
 (defrule gquestion15-y
  (gquestion15 y)
  =>
 (read-from-web "���D�E�D�A�O�_ı�o�A�����⤣���մ��O�H(y/n)" gquestion9))
  
  (defrule gquestion9-n
  (gquestion9 n)
  =>
  (read-from-web "���D�Q���D�A��z�즳����ܡH(y/n)" gquestion16))
 
 (defrule gquestion16-y
  (gquestion16 y)
  =>
  (read-from-web "���D�Q�D�бq�U�C��تᤤ��ܧA�����w���@�ءG(Y=�V�鸪/N=�����)" gquestion10))
 
 (defrule gquestion10-n
  (gquestion10 n)
  =>
  (read-from-web "���D�Q�@�D�A�O�_���@�Ӧ��d���ߪ��ǥͩ�¾���O�H(y/n)" gquestion11))
 
(defrule gquestion11-n
 (gquestion11 n)
 =>
 (read-from-web "���D�Q�C�D�бq�U�C����C�⤤��ܧA�����w���@�ءG(Y=��/���/N=����)" gquestion17))
 
(defrule gquestion17-y
 (gquestion17 y)
=>
(read-from-web "���D�Q�G�D�A�̪���u��������ܡH(y/n)" gquestion12))
 
(defrule gquestion12-n
 (gquestion12 n)
=>
(read-from-web "���D���D�A�@�N�ӽФ@���ݭn�u�@�g�窺¾��ܡH(y/n)" gquestion6))
 
(defrule gquestion6-y
 (gquestion6 y)
 =>
 (read-from-web "���D�C�D�A����B�ͪ��w��A�O�_�]���A�O�@�ӥi�a���H�O�H(y/n)" gquestion7))
 
(defrule gquestion13-n
 (gquestion13 n)
 =>
(read-from-web "���D�Q�E�D�A�|���Ҥ�A�X�⪺�H�ܡH(y/n)" gquestion19))
 
(defrule gquestion19-n
 (gquestion19 n)
 =>
(read-from-web "���D�G�Q���D�A�����w�U�C���@�ةʮ檺�H�O�H(Y=�B�ʫ�/N=������)" gquestion26))
 
(defrule gquestion26-y
 (gquestion26 y)
 =>
(read-from-web "���D�G�Q�D�A���N�b�������Ҥj���Τj�n�͸ܶܡH" gquestion20))
 
(defrule gquestion20-y
 (gquestion20 y)
=>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "C���G�i�R�p���̤H��" crlf) 
 (printout t "     �A�O�@�Ө̿�Τ�ʥD�����H�A�]�����ʪB���`" crlf)
 (printout t "     �Oı�o�A�O�L�̪��p�� ��?�p�E�E�C�b�|������" crlf)
 (printout t "     �����A�A�O�̾A�X���B���@���C�A�ন�\�a��"   crlf)
 (printout t "     �ڰt���Ŷ����ɶ��F�A�`�Ʊ�A�O���H������"   crlf)
 (printout t "     �I�C�������i�����O�A�� ���ʪ��L�H�A�]���B"  crlf)
 (printout t "     �̳ͭ����ߦa�O�@�η��U�A�C��۲M��������" crlf)
 (printout t "     �A ��O�A��[���w��C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion14-y
 (gquestion14 y)
 =>
(read-from-web "���D�G�Q�D�A���N�b�������Ҥj���Τj�n�͸ܶܡH(y/n)" gquestion20))
 
(defrule gquestion16-n
 (gquestion16 n)
 =>
(read-from-web "���D�G�Q�G�D�A���w�ݹq������|�`�ضܡH(y/n)" gquestion22))
 
(defrule gquestion22-y
 (gquestion22 y)
 =>
(read-from-web "���D�G�Q�T�D�A�{���¤ͽ����Y����b���ʪB�ͦb�����s�b�ܡH(y/n)" gquestion23))
 
(defrule gquestion23-y
 (gquestion23 y)
 =>
 (read-from-web "���D�Q�C�D�бq�U�C����C�⤤��ܧA�����w���@�ءG(Y=��/���/N=����)" gquestion17))
 
(defrule gquestion17-n
 (gquestion17 n)
=>
(read-from-web "���D�G�Q�|�D�A�Q�ǲ߲i���ܡH" gquestion24))
 
(defrule gquestion24-y
 (gquestion24 y)
=>
(read-from-web "���D�Q�K�D�A�����w�s�٬O���v�O�H" gquestion18))
 
(defrule gquestion18-y
 (gquestion18 y)
=>
(read-from-web "���D�Q�T�D�A�{���A�O�@�ӿˤ��͵����H�ܡH" gquestion13))

 (defrule gquestion21-y
 (gquestion21 y)
 =>
 (read-from-web "���D�Q���D�A��z�즳����ܡH(y/n)" gquestion16))

(defrule gquestion21-n
 (gquestion21 n)
 =>
(read-from-web "���D�G�Q�K�D�A�����w���٬O�ߩO�H(Y=��/N=��)" gquestion28))
 
(defrule gquestion28-y
 (gquestion28 y)
 =>
(read-from-web "���D�G�Q�G�D�A���w�ݹq������|�`�ضܡH(y/n)" gquestion22))
 
(defrule gquestion22-n
 (gquestion22 n)
 =>
 (read-from-web "���D�G�Q�E�D�A�q�`�|��a�����X��ܡH(y/n)" gquestion29))
 
(defrule gquestion29-y
 (gquestion29 y)
 =>
 (read-from-web "���D�T�Q�D�A�����w�Ӷ��٬O��G�O�H(Y=�Ӷ�/N=��G)" gquestion30))
 
(defrule gquestion30-y
 (gquestion30 y)
 =>
(read-from-web "���D�G�Q�T�D�A�{���¤ͽ����Y����b���ʪB�ͦb�����s�b�ܡH(y/n)" gquestion23))
 
(defrule gquestion23-n
 (gquestion23 n)
 =>
(read-from-web "���D�Q�D�бq�U�C��تᤤ��ܧA�����w���@�ءG(Y=�V�鸪/N=�����)" gquestion10))
 
(defrule gquestion15-n
 (gquestion15 n)
 =>
(read-from-web "���D�G�Q�@�D�A�|�g�`���B�A���ж��ܡH(y/n)" gquestion21))
 
(defrule gquestion24-n
 (gquestion24 n)
 =>
(read-from-web "���D�T�Q�@�D�A�g�`���ܧA���v���ܡH(y/n)" gquestion31))
 
(defrule gquestion31-y
 (gquestion31 y)
 =>
(read-from-web "���D�G�Q���D�A�郎�p����(Internet)������ܡH(y/n)" gquestion25))
 
(defrule gquestion25-n
 (gquestion25 n)
 =>
(read-from-web "���D�T�Q�G�D�A�Ȩ�L�H�O�Aı�o�ܦ��L�ܡH(y/n)" gquestion32))
 
(defrule gquestion32-y
 (gquestion32 y)
 =>
(read-from-web "���D�G�Q���D�A�����w�U�C���@�ةʮ檺�H�O�H(Y=�B�ʫ�/N=������)" gquestion26))
 
(defrule gquestion26-n
 (gquestion26 n)
 =>
(read-from-web "���D�T�Q�E�D�A��s�y��u��������ܡH(y/n)" gquestion39))
 
(defrule gquestion39-y
 (gquestion39 y)
 =>
(read-from-web "���D�T�Q�T�D�A�q�`�O��������Y�v�ܡH(y/n)" gquestion33))
 
(defrule gquestion33-y
 (gquestion33 y)
 =>
(read-from-web "���D�G�Q�C�D�A���w��ۤά�ģ�W�P�ɸ˶ܡH(y/n)" gquestion27))
 
(defrule gquestion27-y
 (gquestion27 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B���G���N�a��" crlf) 
 (printout t "     �A���h�Ӯƪ��ʮ��`�O�O�B�ͭ�ı�o�A�O�L�̪�" crlf)
 (printout t "     �j����/�j�j�j�C�B�� �̳��ܫH���A�F�L��ı�o" crlf)
 (printout t "     �P�A��ѫܵΪA�åB�O�@�ؼֽ�C�q�`�@�Ǧ~ "  crlf)
 (printout t "     ����A�p�ӥB�P���ܮz�����ʳ��|���A�l�ޡC"   crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion27-n
 (gquestion27 n)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D���G���g�H�l�ޡ���"crlf) 
 (printout t "     �b�|�����������A�A�O�̩ʷP���@���C�a�A�g�H" crlf)
 (printout t "     ���A�ܨ��B�̪ͭ��w�� �ӥB��O���H�������I"  crlf)
 (printout t "     �O�I�i�O�A�B�̩ͭ����u�O�d�R�A���~���F���i" crlf)
 (printout t "     �A���n�L���H�����ʪ������e�y�I�t�~�A�Ʊ�A" crlf)
 (printout t "     ����h�Ǫ�{�A�����z �ΥD���A�o�˧A�K�ন"  crlf)
 (printout t "     ���@�ӥ~�b�Τ��b���ݳƪ��H�C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion28-n
 (gquestion28 n)
 =>
(read-from-web "���D�T�Q�|�D�A�����i�����߯g���ܡH(y/n)" gquestion34))
 
(defrule gquestion34-y
 (gquestion34 y)
 =>
(read-from-web "���D�G�Q�E�D�A�q�`�|��a�����X��ܡH(y/n)" gquestion29))
 
(defrule gquestion29-n
 (gquestion29 n)
 =>
(read-from-web "���D�T�Q���D�A�O�_�֦��ܦh�˹��~�O�H(y/n)" gquestion35))
 
(defrule gquestion35-y
 (gquestion35 y)
 =>
(read-from-web "���D�T�Q���D�A���w�b�����θ`������ʪ��ܡH(y/n)" gquestion36))
 
(defrule gquestion36-y
 (gquestion36 y)
 =>
(read-from-web "���D�T�Q�C�D�N�ӧA�Ʊ�s�y�J���ܡH(y/n)" gquestion37))
 
(defrule gquestion37-y
 (gquestion37 y)
 =>
(read-from-web "���D�T�Q�G�D�A�Ȩ�L�H�O�Aı�o�ܦ��L�ܡH(y/n)" gquestion32))
 
(defrule gquestion32-n
 (gquestion32 n)
 =>
(read-from-web "���D�T�Q�K�D�A�Q���D��A����Ǫ��ڦ��ܡH(y/n)" gquestion38))
 
(defrule gquestion38-y
 (gquestion38 y)
 =>
(read-from-web "���D�|�Q�D�A�O�_�@�Ӱl�H�ɸ˼�y���H�O�H(y/n)" gquestion40))
 
(defrule gquestion40-y
 (gquestion40 y)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "C���G�i�R�p���̤H��" crlf) 
 (printout t "     �A�O�@�Ө̿�Τ�ʥD�����H�A�]�����ʪB���`" crlf)
 (printout t "     �Oı�o�A�O�L�̪��p�� ��?�p�E�E�C�b�|������" crlf)
 (printout t "     �����A�A�O�̾A�X���B���@���C�A�ন�\�a��"   crlf)
 (printout t "     �ڰt���Ŷ����ɶ��F�A�`�Ʊ�A�O���H������"   crlf)
 (printout t "     �I�C�������i�����O�A�� ���ʪ��L�H�A�]���B"  crlf)
 (printout t "     �̳ͭ����ߦa�O�@�η��U�A�C��۲M��������" crlf)
 (printout t "     �A ��O�A��[���w��C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion30-n
 (gquestion30 n)
 =>
(read-from-web "���D�G�Q�|�D�A�Q�ǲ߲i���ܡH(y/n)" gquestion30))
 
 (defrule gquestion31-n
 (gquestion31 n)
 =>
(read-from-web "���D�T�Q�C�D�N�ӧA�Ʊ�s�y�J���ܡH(y/n)" gquestion37))
 
(defrule gquestion37-n
 (gquestion37 n)
 =>
 (read-from-web "���D�T�Q�K�D�A�Q���D��A����Ǫ��ڦ��ܡH(y/n)" gquestion38))
 
(defrule gquestion38-n
 (gquestion38 n)
 =>
(read-from-web "���D�T�Q�E�D�A��s�y��u��������ܡH(y/n)" gquestion39))
 
(defrule gquestion39-n
 (gquestion39 n)
 =>
(read-from-web "���D�G�Q�C�D�A���w��ۤά�ģ�W�P�ɸ˶ܡH(y/n)" gquestion27))

(defrule gquestion33-n
 (gquestion33 n)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "C���G�i�R�p���̤H��" crlf) 
 (printout t "     �A�O�@�Ө̿�Τ�ʥD�����H�A�]�����ʪB���`" crlf)
 (printout t "     �Oı�o�A�O�L�̪��p�� ��?�p�E�E�C�b�|������" crlf)
 (printout t "     �����A�A�O�̾A�X���B���@���C�A�ন�\�a��"   crlf)
 (printout t "     �ڰt���Ŷ����ɶ��F�A�`�Ʊ�A�O���H������"   crlf)
 (printout t "     �I�C�������i�����O�A�� ���ʪ��L�H�A�]���B"  crlf)
 (printout t "     �̳ͭ����ߦa�O�@�η��U�A�C��۲M��������" crlf)
 (printout t "     �A ��O�A��[���w��C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

 (defrule gquestion34-n
 (gquestion34 n)
 =>
(read-from-web "���D�T�Q���D�A�O�_�֦��ܦh�˹��~�O�H(y/n)" gquestion35))
 
(defrule gquestion35-n
 (gquestion35 n)
 =>
(read-from-web "���D�T�Q�C�D�N�ӧA�Ʊ�s�y�J���ܡH(y/n)" gquestion37))

(defrule gquestion36-n
 (gquestion36 n)
 =>
(read-from-web "���D�T�Q�@�D�A�g�`���ܧA���v���ܡH(y/n)" gquestion31))

(defrule gquestion40-n
 (gquestion40 n)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D���G���g�H�l�ޡ���"crlf) 
 (printout t "     �b�|�����������A�A�O�̩ʷP���@���C�a�A�g�H" crlf)
 (printout t "     ���A�ܨ��B�̪ͭ��w�� �ӥB��O���H�������I"  crlf)
 (printout t "     �O�I�i�O�A�B�̩ͭ����u�O�d�R�A���~���F���i" crlf)
 (printout t "     �A���n�L���H�����ʪ������e�y�I�t�~�A�Ʊ�A" crlf)
 (printout t "     ����h�Ǫ�{�A�����z �ΥD���A�o�˧A�K�ন"  crlf)
 (printout t "     ���@�ӥ~�b�Τ��b���ݳƪ��H�C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion4-y
  (gquestion4 y)
  =>
  (read-from-web "���D�Q�@�D�A�O�_���@�Ӧ��d���ߪ��ǥͩ�¾���O�H(y/n)" gquestion11))
 
(defrule two
 (w-y two)
 => 
 (read-from-web "��ܪ��O�u�A�O����˪��H�v�߲z����(y/n)?" two))

(defrule two-n
(two n)
 =>
 (printout t "�����A�����F" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule two-y
 (two y)
 =>
 (printout t " " crlf)
 (read-from-web "���D�@�D�z��N�Q�ѱߤW�Y���F������O�U�ӶܡH(y/n)" mquestion1))
 
(defrule mquestion1-y
 (mquestion1 y)
 =>
 (read-from-web "���D�G�D�z�{���ʤH���Ӳo��H(y/n)" mquestion2))
 
(defrule mquestion2-y
 (mquestion2 y)
 =>
 (read-from-web "���D�T�D�p�G�U���l��L�A�z�|�Q��k�H�ܡH(y/n)" mquestion3))
 
(defrule mquestion3-y
 (mquestion3 y)
 =>
 (read-from-web "���D�|�D���\�j�����b�~���Y�H(y/n)" mquestion4))
 
(defrule mquestion4-y
 (mquestion4 y)
 =>
 (read-from-web "���D�K�D��ۤv�D�`�F�ѡH(y/n)" mquestion8))
 
(defrule mquestion8-y
 (mquestion8 y)
 =>
 (read-from-web "���D�Q���D�`�`�|�Q�_�H�e�橹���ʤH�M���w���H�H(y/n)" mquestion16))
 
(defrule mquestion16-y
 (mquestion16 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "E���G�A�O�@�ӭ��P�����H" crlf) 
 (printout t "     �u�n�����A���߷P�캡�����F��A" crlf)
 (printout t "     �A���i�H���áA���ެO�b�� ��~���ҶR�����~�A" crlf)
 (printout t "     �άO�B�Ͱe���A��§���A���~���������� ���~�A�άO�������H���A" crlf)
 (printout t "     �C�ֶ骺�J�����A�K�ȡA�u�n�@�ݨ쨺�@ �ǪF��A�N��İ_�A��ɪ��^�СA" crlf)
 (printout t "     ��o�@�ǹ�A�ӻ��N�q�D�Z���F �讳�X�ӵ��B �ͪY��A���ɡA�O�A���@�j�ֽ�C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule mquestion1-n
 (mquestion1 n)
 =>
 (read-from-web "���D���D�ݲ��ʮɡA�A�|���ݲ����H(y/n)" mquestion5))
 
(defrule mquestion5-y
 (mquestion5 y)
 =>
 (read-from-web "���D���D�A�{�b���b�ǲ߬Y�ؽҵ{�H(y/n)" mquestion6))
 
(defrule mquestion6-y
 (mquestion6 y)
 =>
 (read-from-web "���D�C�D�u�n���P�Ƿ|�A�@�w�|�ѥ[�H(y/n)" mquestion7))
 
(defrule mquestion7-y
 (mquestion7 y)
 =>
 (read-from-web "���D�K�D��ۤv�D�`�F�ѡH(y/n)" mquestion8))
 
(defrule mquestion2-n
 (mquestion2 n)
 =>
 (read-from-web "���D���D�A�{�b���b�ǲ߬Y�ؽҵ{�H(y/n)" mquestion6))

(defrule mquestion6-n
 (mquestion6 n)
 =>
 (read-from-web "���D�Q�@�D���R�L�Ѳ��ܡH(y/n)" mquestion11))
 
(defrule mquestion11-y
 (mquestion11 y)
 =>
 (read-from-web "���D�Q���D�A��{�b���ͬ��P�캡���ܡH(y/n)" mquestion15))
 
(defrule mquestion15-y
 (mquestion15 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D���G�A�O�@�ӫܮɩ|���H" crlf) 
 (printout t "     �A�ܦ��y�檺�����A��s�_���ƪ����D�`���ߡC" crlf)
 (printout t "     �l�D�ɻ쪺�A �̾A�X������N�O�}����ʤ@�ǪA���A�t�������F��C" crlf)
 (printout t "     �U�l�A�c�l�A�٫��������A�u�n�O�����A������F��A�άO�{�b������F��A" crlf)
 (printout t "     �A���D�`�a������A�ӥB�A��y�檺���Ѥ]�ܨ���j�a���֩w�o�C " crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule mquestion3-n
 (mquestion3 n)
 =>
 (read-from-web "���D�C�D�u�n���P�Ƿ|�A�@�w�|�ѥ[�H(y/n)" mquestion7))
 
(defrule mquestion7-n
 (mquestion7 n)
 =>
 (read-from-web "���D�Q�@�D���R�L�Ѳ��ܡH(y/n)" mquestion11))
 
(defrule mquestion11-n
 (mquestion11 n)
 =>
 (read-from-web "���D�Q�G�D�b�\�U�Y�n�Y�������A�]�|�Q�^�a�ۤv�ʤⰵ���ݡH(y/n)" mquestion12))
 
(defrule mquestion12-y
 (mquestion12 y)
 =>
 (read-from-web "���D�Q���D�A��{�b���ͬ��P�캡���ܡH(y/n)" mquestion15))
 
(defrule mquestion15-n
 (mquestion15 n)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "C���G�A�O�@�Ӽ��R�d�����H" crlf)
 (printout t "     �A�D�`���w�p�ʪ��A���ެO�ߩΪ����A�A���R�����o�F�C" crlf)
 (printout t "     �@���ŧA�N�|�N�A���ɶ�������b���U�ʪ��W���A���ʪ��~������A�a�L�̥h���B�C" crlf)
 (printout t "     �b�~���ݨ��߱󪯧A�]�|�q���e�㪺��^�a�A���i�L�̡C" crlf)
 (printout t "     �t�~��R�����l���ߪ��A�ӻ��A�R����M���q�ʤ]�O�ܳt�t�C " crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
(defrule mquestion4-n
 (mquestion4 n)
 =>
 (read-from-web "���D�C�D�u�n���P�Ƿ|�A�@�w�|�ѥ[�H(y/n)" mquestion7))
 
(defrule mquestion5-n
 (mquestion5 n)
 =>
 (read-from-web "���D�E�D�A�{�����׫ܥi�ȡH(y/n)" mquestion9))
 
(defrule mquestion9-y
 (mquestion9 y)
 =>
 (read-from-web "���D�Q�T�D���W��20�����H�W����ۤv�H(y/n)" mquestion13))
 
(defrule mquestion13-y
 (mquestion13 y)
 =>
 (read-from-web "���D�Q�|�D�A�|�}���ܡH(y/n)" mquestion14))
 
(defrule mquestion14-y
 (mquestion14 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B���G�A�O�@�Ӫ`���ͬ����쪺�H" crlf)
 (printout t "     ���a�����A�A�̾A�X������N�O���@�ǯ�G�m���Ҫ���u���~�C" crlf)
 (printout t "     �A�ܳ��w�ݨ��ۤv�ҩ~���ж��Q�ۤv�����~�˹������������A" crlf)
 (printout t "     ���F�ܦ����N�P���~�A�A�|ı�o�ܶ}�ߡC���ެO���U���~�A���_�s´�A" crlf)
 (printout t "     ���������A�A���_�ӳ��|�ܱo�����⪺�A�֦b�䤤�C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
(defrule mquestion8-n
 (mquestion8 n)
 =>
 (read-from-web "���D�Q�G�D�b�\�U�Y�n�Y�������A�]�|�Q�^�a�ۤv�ʤⰵ���ݡH(y/n)" mquestion12))
 
(defrule mquestion12-n
 (mquestion12 n)
 =>
 (read-from-web "���D�Q���D�`�`�|�Q�_�H�e�橹���ʤH�M���w���H�H(y/n)" mquestion16))
 
(defrule mquestion16-n
 (mquestion16 n)
  =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D���G�A�O�@�ӫܮɩ|���H" crlf) 
 (printout t "     �A�ܦ��y�檺�����A��s�_���ƪ����D�`���ߡC" crlf)
 (printout t "     �l�D�ɻ쪺�A �̾A�X������N�O�}����ʤ@�ǪA���A�t�������F��C" crlf)
 (printout t "     �U�l�A�c�l�A�٫��������A�u�n�O�����A������F��A�άO�{�b������F��A" crlf)
 (printout t "     �A���D�`�a������A�ӥB�A��y�檺���Ѥ]�ܨ���j�a���֩w�o�C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
(defrule mquestion13-n
 (mquestion13 n)
 =>
 (read-from-web "���D�Q�D�A�l�϶ܡH(y/n)" mquestion10))
 
(defrule mqeustion10-y
 (mquestion10 y)
 =>
 (read-from-web "���D�Q�@�D���R�L�Ѳ��ܡH(y/n)" mquestion11))
 
(defrule mquestion10-n
 (mquestion10 n)
 =>
 (read-from-web "���D�Q�|�D�A�|�}���ܡH(y/n)" mquestion14))

(defrule mquestion14-n
 (mquestion14 n)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "A���G�A�O�@�ӫܹ�ڪ��H" crlf)
 (printout t "     �̾A�X�A���𶢬��ʴN�O�h�������ʶR���ǥi�H�W�Ȫ��F��C" crlf)
 (printout t "     ���ެO���~��άO�Q�~��~��ݨ�^�X���F��A" crlf)
 (printout t "     �u�n�O�J�ೳ�M�� �ߤS����U�x�W�����ʡA�A����|�D�`��J�C" crlf)
 (printout t "     �������l���աA�����~�A���N�~�����O����������C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
 (defrule three
 (w-y three)
 => 
 (read-from-web "����T:�å@�^���߲z����(y/n)?" three))

(defrule three-n
(three n)
 =>
 (printout t "�����A�����F" crlf)
 (printout t crlf ?*homepage* crlf))



 (defrule three-y
 (three y)
 =>
 (printout t " " crlf)
 (read-from-web "1.���p�A�{�b���@�����h�ؤ@�y�ڴK�H�D���O�֡A�A�|���(y=��Z��������/n=�j�����j��)" nquestion1))
 
(defrule nquestion1-y
 (nquestion1 y)
 =>
 (read-from-web "5.��i�ɡA�A�|(y=�r���/n=�`�I�l)" nquestion5))
 
(defrule nquestion5-y
 (nquestion5 y)
 =>
(read-from-web "6.�p�G�i�઺�ܡA�C�³��Q�@���ΤU�h�A���Q�_�ɪ�u�H(y/n)" nquestion6))
 
 (defrule nquestion6-y
 (nquestion6 y)
 =>
 (read-from-web "7.�W�Z�û����Q�������H(y/n)" nquestion7))
 
 (defrule nquestion7-y
 (nquestion7 y)
=>
(read-from-web "10.�b���W�}���ɡA�������۫�l�W�ӻP�A�æ�A�A�{���������O�H(y=�f��/n=�}�O�]��)" nquestion10))
 
(defrule nquestion10-y
 (nquestion10 y)
=>
(read-from-web "9.�P�Ʒ|���WĹ�ɰ��K�h�A�A�|�_�U�`�H(y/n)" nquestion9))
 
 (defrule nquestion9-y
 (nquestion9 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "C���G�İʫ�" crlf) 
 (printout t "     �A���HĲı�ӾU�A�s���H�t�A���ƷF�l�Q���A��(��)�S�֤W��A" crlf)
 (printout t "     �������I�İʡA�ӥB�n���Q�p�p�ӧQ�R���Y���A�ҥH�{�ɷQ��" crlf)
 (printout t "     �~����}�A���ӧ�Ӧ��g����Y���N�R���H�X�@�C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
 (defrule nquestion1-n
 (nquestion1 n)
 =>
 (read-from-web "2.���B�ͭ����A�A�|����I��H(y=�I��O�H�P�˪���/n=���ݨ������Ѧ�����n���Ы�A�I��)" nquestion2))
 
(defrule nquestion2-y
 (nquestion2 y)
 =>
(read-from-web "3.�B�ͷǳưe�@�˪F��P�A��¾�A�A�Ʊ�o��H(y=�}�Yޱ�g�u����/n=�oB�y�i��)" nquestion9))
 
(defrule nquestion3-y
 (nquestion3 y)
 =>
(read-from-web "4.�W�q�X���A�A�|(y=�i�D�L/n=���@�n)" nquestion4))
 
(defrule nquestion4-y
 (nquestion4 y)
 =>
(read-from-web "5.��i�ɡA�A�|(y=�r���/n=�`�I�l)" nquestion5))
 
(defrule nquestion5-n
 (nquestion5 n)
 =>
(read-from-web "10.�b���W�}���ɡA�������۫�l�W�ӻP�A�æ�A�A�{���������O�H(y=�f��/n=�}�O�]��)" nquestion10))
 
(defrule nquestion10-n
 (nquestion10 n)
=>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D���G��j�ƫ�" crlf) 
 (printout t "     �A���N�R���F�����Y���A�W�H���@�O�M�M�~�����ѡA�A�����o�����A" crlf)
 (printout t "     �A�o�����պ믫�A�åB���H�����A���D�ۤv���u�I�M���I�A" crlf)
 (printout t "     �Ȯɤ��u�O���|�M�n���ɡA���u�n����k�A�A�@�w�i�H���f���_���C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule nquestion2-n
 (nquestion2 n)
 =>
(read-from-web "4.�W�q�X���A�A�|(y=�i�D�L/n=���@�n)" nquestion4))
 
(defrule nquestion4-n
 (nquestion4 n)
 =>
(read-from-web "8.���Q�W�q�j�|�A�A�|(y=��L�ơA������ı�o�n��/n=�V�W�q�D�p�A�M��߸̽L��p��ѨM)" nquestion8))
 
(defrule nquestion8-y
 (nquestion8 y)
 =>
(read-from-web "12.���]�u���Q�~�P�H�ۨ��A�A�|�_�Ʊ�L���~�򦬯d�A�H(y/n)" nquestion12))
 
(defrule nquestion12-y
 (nquestion12 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B���G�f�V��" crlf) 
 (printout t "     �A���M�\���״I�A�Y���M���A�`��ʮ���ԷV�A" crlf)
 (printout t "     ���M���ܩ���Y�尭������A�����ɧA���K�|���H�~�ѡA" crlf)
 (printout t "     ���@�A�Ҽ{�����A���|�w�g�n�n���C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule nquestion3-n
 (nquestion3 n)
 =>
(read-from-web "5.��i�ɡA�A�|(y=�r���/n=�`�I�l)" nquestion5))

(defrule nquestion6-n
 (nquestion6 n)
 =>
(read-from-web "8.���Q�W�q�j�|�A�A�|(y=��L�ơA������ı�o�n��/n=�V�W�q�D�p�A�M��߸̽L��p��ѨM)" nquestion8))
 
(defrule nquestion8-n
 (nquestion8 n)
 =>
(read-from-web "11.�p�G�A�i�H�ܦ�����H�A�A�̷Q�ܦ��H(y=���ӭ�/n=��ù��)" nquestion11))
 
(defrule nquestion11-y
 (nquestion11 y)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B���G�f�V��" crlf) 
 (printout t "     �A���M�\���״I�A�Y���M���A�`��ʮ���ԷV�A" crlf)
 (printout t "     ���M���ܩ���Y�尭������A�����ɧA���K�|���H�~�ѡA" crlf)
 (printout t "     ���@�A�Ҽ{�����A���|�w�g�n�n���C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule nquestion7-n
 (nquestion7 n)
=>
(read-from-web "11.�p�G�A�i�H�ܦ�����H�A�A�̷Q�ܦ��H(y=���ӭ�/n=��ù��)" nquestion11))
 
(defrule nquestion11-n
 (nquestion11 n)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D���G��j�ƫ�" crlf) 
 (printout t "     �A���N�R���F�����Y���A�W�H���@�O�M�M�~�����ѡA�A�����o�����A" crlf)
 (printout t "     �A�o�����պ믫�A�åB���H�����A���D�ۤv���u�I�M���I�A" crlf)
 (printout t "     �Ȯɤ��u�O���|�M�n���ɡA���u�n����k�A�A�@�w�i�H���f���_���C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule nquestion9-n
 (nquestion9 n)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "A���G�ȭ��ȧ���" crlf) 
 (printout t "     ���઺�|�ܧA�w�u�����A�������Ȯ𪺫K�s�ȭ��ȧ��A" crlf)
 (printout t "     �s�����J�������Cancer�A�Ʊ�A�O�@�@����" crlf)
 (printout t "     �|���Ӥj���ܡA�K�o�A������C" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule nquestion12-n
 (nquestion12 n)
 =>
(read-from-web "11.�p�G�A�i�H�ܦ�����H�A�A�̷Q�ܦ��H(y=���ӭ�/n=��ù��)" nquestion11))



 

