(defglobal ?*host* = "127.0.0.1")
(defglobal ?*servlet* = "JessServlet")
(defglobal ?*homepage* = (str-cat "<p><a href=\"http://" ?*host* "/sylee/courses/jess/projects/com/com.htm\">個性分析系統</a>"))

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
; (printout t (toUnicode "歡迎光臨 * * 個性分析系統 * *") crlf)
; (printout t " " crlf)
; (read-from-web "要開始嗎(y/n)? " welcome))
 
;(defrule w-y
; (welcome y)
;=>
; (printout t " " crlf)
; (printout t (toUnicode "* * 祝你玩的愉快 * *") crlf)
; (printout t " " crlf)
; (read-from-web "請選題目(one,two,three) : " w-y))


;(defrule w-n
;(welcome n)
;=>
; (printout t " " crlf)
; (printout t (toUnicode "* * 歡迎下次再來 * *") crlf))
 
 
(defrule one
 (w-y one)
 => 
 (read-from-web "選擇的是「暸解自己的個性」心理測驗(y/n)? " one))

(defrule one-n
(one n)
 =>
 (printout t "結束，不玩了" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule one-y
(one y)
 =>
 (printout t " " crlf)
 (read-from-web "問題一．你認為你是一個有個性，有自己的思想及主見的人嗎？(y/n)" gquestion1))
 
(defrule gquestion1-y
 (gquestion1 y)
 =>
 (read-from-web "問題二．你較喜歡星形還是心形的項鏈呢？ (y=星形/n=心形)" gquestion2))
 
(defrule gquestion2-y
 (gquestion2 y)
 =>
 (read-from-web "問題三．你喜歡玩洋娃娃或機械人嗎？(y/n)" gquestion3))
 
(defrule gquestion3-y
 (gquestion3 y)
 =>
 (read-from-web "問題十一．你是否為一個有責任心的學生或職員呢？(y/n)" gquestion11))
 
(defrule gquestion11-y
 (gquestion11 y)
 =>
 (read-from-web "問題五．你的衣櫃裡有紅色的衣服嗎？(y/n)" gquestion5))
 
(defrule gquestion5-y
 (gquestion5 y)
 =>
 (read-from-web "問題六．你願意申請一份需要工作經驗的職位嗎？(y/n)" gquestion6))
 
(defrule gquestion6-y
 (gquestion6 y)
 =>
 (read-from-web "問題七．你受到朋友的歡迎，是否因為你是一個可靠的人呢？(y/n)" gquestion7))
  
(defrule gquestion7-y
  (gquestion7 y)
=>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t  "A型：單純外向型" crlf) 
 (printout t  "     你是一個外向和樂觀的人。雖然你也有挫折失敗" crlf)
 (printout t  "     的時侯，但開朗的你很快便會振作起來。異性朋" crlf)
 (printout t  "     友很喜歡你親切友善的性格，但也同時令你的配" crlf)
 (printout t  "     偶失去安全感。不懂表達感情是你的缺點，但寬" crlf)
 (printout t  "     容、大量及慷慨是你受歡迎的原因。同性朋友很" crlf)
 (printout t  "     難了解你，因為你性格天真單純，但這正是你吸" crlf)
 (printout t  "     引異性的有利條件呢！" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
 (defrule gquestion1-n
  (gquestion1 n)
  =>
  (read-from-web "問題八．你是短頭髮的嗎？(y/n)" gquestion8))
  
  (defrule gquestion8-y
  (gquestion8 y)
  =>
  (read-from-web "問題二．你較喜歡星形還是心形的項鏈呢？ (Y=星形/N=心形)" gquestion2))
 
 (defrule gquestion2-n
 (gquestion2 n)
 =>
 (read-from-web "問題九．你是否覺得你的膚色不夠白晰呢？(y/n)" gquestion9))
  
  (defrule gquestion9-y
  (gquestion9 y)
  =>
  (read-from-web "問題三．你喜歡玩洋娃娃或機械人嗎？(y/n)" gquestion3))
 
 (defrule gquestion3-n
 (gquestion3 n)
 =>
 (read-from-web "問題四．你對中國的傳統服式有興趣嗎？(y/n)" gquestion4))
  
  (defrule gquestion4-n
  (gquestion4 n)
  =>
  (read-from-web "問題五．你的衣櫃裡有紅色的衣服嗎？(y/n)" gquestion5))
 
(defrule gquestion5-n
 (gquestion5 n)

 =>
(read-from-web "問題十二．你最近對手工藝有興趣嗎？(y/n)" gquestion12))
 
(defrule question12-y
 (gquestion12 y)
=>
(read-from-web "問題十八．你較喜歡山還是海洋呢？(Y=山/N=海洋)" gquestion18))
 
 (defrule gquestion18-n
 (question18 n)
 =>
 (read-from-web "問題二十五．你對互聯網絡(Internet)有興趣嗎？(y/n)" gquestion25))
  
  (defrule question25-y
  (gquestion25 y)
  =>
  (read-from-web "問題十九．你會妒忌比你出色的人嗎？(y/n)" gquestion19))
 
(defrule gquestion19-y
 (gquestion19 y)
 =>
 (read-from-web "問題十四．你介意與一群異性朋友睡在相同的一張床嗎？(y/n)" gquestion14))
 
(defrule gquestion14-y
 (gquestion14 y)
 =>
(read-from-web "問題二十．你介意在公眾場所大笑或大聲談話嗎？(y/n)" gquestion20))
 
(defrule gquestion20-n
 (gquestion20 n)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B型：藝術家型" crlf) 
 (printout t "     你關懷照料的性格總是令朋友們覺得你是他們的" crlf)
 (printout t "     大哥哥/大姐姐。朋友 們都很信任你；他們覺得" crlf)
 (printout t "     與你聊天很舒服並且是一種樂趣。通常一些年 "  crlf)
 (printout t "     紀比你小而且感情脆弱的異性都會受你吸引。"   crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

 (defrule gquestion2-n
 (gquestion2 n)
 =>
 (read-from-web "問題九．你是否覺得你的膚色不夠白晰呢？(y/n)" gquestion9))
  
  (defrule gquestion9-n
  (gquestion9 n)
  =>
  (read-from-web "問題十六．你對理科有興趣嗎？" gquestion16))
 
;(defrule question16-y
 ;(gquestion16 y)
 ;=>
;(read-from-web "問題十．請從下列兩種花中選擇你較喜歡的一種：(Y=向日葵/N=野菊花)" gquestion10))
 
 (defrule gquestion10-y
 (gquestion10 y)
 =>
 (read-from-web "問題十四．你介意與一群異性朋友睡在相同的一張床嗎？(y/n)" gquestion14))
 
 (defrule gquestion14-n
 (gquestion14 n)
=>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "A型：單純外向型" crlf) 
 (printout t "     你是一個外向和樂觀的人。雖然你也有挫折失敗" crlf)
 (printout t "     的時侯，但開朗的你很快便會振作起來。異性朋" crlf)
 (printout t "     友很喜歡你親切友善的性格，但也同時令你的配" crlf)
 (printout t "     偶失去安全感。不懂表達感情是你的缺點，但寬" crlf)
 (printout t "     容、大量及慷慨是你受歡迎的原因。同性朋友很" crlf)
 (printout t "     難了解你，因為你性格天真單純，但這正是你吸" crlf)
 (printout t "     引異性的有利條件呢！" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion6-n
 (gquestion6 n)
 =>
(read-from-web "問題十三．你認為你是一個親切友善的人嗎？" gquestion13))
 
 (defrule gquestion13-y
 (gquestion13 y)
 =>
 (read-from-web "問題七．你受到朋友的歡迎，是否因為你是一個可靠的人呢？(y/n)" gquestion7))
 
 (defrule gquestion7-n
  (gquestion7 n)
=>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B型：藝術家型" crlf) 
 (printout t "     你關懷照料的性格總是令朋友們覺得你是他們的" crlf)
 (printout t "     大哥哥/大姐姐。朋友 們都很信任你；他們覺得" crlf)
 (printout t "     與你聊天很舒服並且是一種樂趣。通常一些年 "  crlf)
 (printout t "     紀比你小而且感情脆弱的異性都會受你吸引。"   crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

 (defrule gquestion8-n
  (gquestion8 n)
  =>
  (read-from-web "問題十五．運動是否你主要的業/課餘活動呢？(y/n)" gquestion15))
 
 (defrule gquestion15-y
  (gquestion15 y)
  =>
 (read-from-web "問題九．你是否覺得你的膚色不夠白晰呢？(y/n)" gquestion9))
  
  (defrule gquestion9-n
  (gquestion9 n)
  =>
  (read-from-web "問題十六．你對理科有興趣嗎？(y/n)" gquestion16))
 
 (defrule gquestion16-y
  (gquestion16 y)
  =>
  (read-from-web "問題十．請從下列兩種花中選擇你較喜歡的一種：(Y=向日葵/N=野菊花)" gquestion10))
 
 (defrule gquestion10-n
  (gquestion10 n)
  =>
  (read-from-web "問題十一．你是否為一個有責任心的學生或職員呢？(y/n)" gquestion11))
 
(defrule gquestion11-n
 (gquestion11 n)
 =>
 (read-from-web "問題十七．請從下列兩種顏色中選擇你較喜歡的一種：(Y=橙/橘色/N=紅色)" gquestion17))
 
(defrule gquestion17-y
 (gquestion17 y)
=>
(read-from-web "問題十二．你最近對手工藝有興趣嗎？(y/n)" gquestion12))
 
(defrule gquestion12-n
 (gquestion12 n)
=>
(read-from-web "問題六．你願意申請一份需要工作經驗的職位嗎？(y/n)" gquestion6))
 
(defrule gquestion6-y
 (gquestion6 y)
 =>
 (read-from-web "問題七．你受到朋友的歡迎，是否因為你是一個可靠的人呢？(y/n)" gquestion7))
 
(defrule gquestion13-n
 (gquestion13 n)
 =>
(read-from-web "問題十九．你會妒忌比你出色的人嗎？(y/n)" gquestion19))
 
(defrule gquestion19-n
 (gquestion19 n)
 =>
(read-from-web "問題二十六．你較喜歡下列哪一種性格的人呢？(Y=運動型/N=成熟型)" gquestion26))
 
(defrule gquestion26-y
 (gquestion26 y)
 =>
(read-from-web "問題二十．你介意在公眾場所大笑或大聲談話嗎？" gquestion20))
 
(defrule gquestion20-y
 (gquestion20 y)
=>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "C型：可愛小鳥依人型" crlf) 
 (printout t "     你是一個依賴及欠缺主見的人，因此異性朋友總" crlf)
 (printout t "     是覺得你是他們的小弟 弟?小妺妺。在四個類型" crlf)
 (printout t "     之中，你是最適合結婚的一類。你能成功地佔"   crlf)
 (printout t "     據配偶空閒的時間；你總希望你是眾人的集中"   crlf)
 (printout t "     點。“楚楚可憐”是你給 異性的印象，因此朋"  crlf)
 (printout t "     友們都熱心地保護及照顧你。穿著清潔整齊的衣" crlf)
 (printout t "     服 能令你更加受歡迎。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion14-y
 (gquestion14 y)
 =>
(read-from-web "問題二十．你介意在公眾場所大笑或大聲談話嗎？(y/n)" gquestion20))
 
(defrule gquestion16-n
 (gquestion16 n)
 =>
(read-from-web "問題二十二．你喜歡看電視的體育節目嗎？(y/n)" gquestion22))
 
(defrule gquestion22-y
 (gquestion22 y)
 =>
(read-from-web "問題二十三．你認為純友誼關係能夠在異性朋友在之間存在嗎？(y/n)" gquestion23))
 
(defrule gquestion23-y
 (gquestion23 y)
 =>
 (read-from-web "問題十七．請從下列兩種顏色中選擇你較喜歡的一種：(Y=橙/橘色/N=紅色)" gquestion17))
 
(defrule gquestion17-n
 (gquestion17 n)
=>
(read-from-web "問題二十四．你想學習烹飪嗎？" gquestion24))
 
(defrule gquestion24-y
 (gquestion24 y)
=>
(read-from-web "問題十八．你較喜歡山還是海洋呢？" gquestion18))
 
(defrule gquestion18-y
 (gquestion18 y)
=>
(read-from-web "問題十三．你認為你是一個親切友善的人嗎？" gquestion13))

 (defrule gquestion21-y
 (gquestion21 y)
 =>
 (read-from-web "問題十六．你對理科有興趣嗎？(y/n)" gquestion16))

(defrule gquestion21-n
 (gquestion21 n)
 =>
(read-from-web "問題二十八．你較喜歡狗還是貓呢？(Y=狗/N=貓)" gquestion28))
 
(defrule gquestion28-y
 (gquestion28 y)
 =>
(read-from-web "問題二十二．你喜歡看電視的體育節目嗎？(y/n)" gquestion22))
 
(defrule gquestion22-n
 (gquestion22 n)
 =>
 (read-from-web "問題二十九．你通常會攜帶香水出街嗎？(y/n)" gquestion29))
 
(defrule gquestion29-y
 (gquestion29 y)
 =>
 (read-from-web "問題三十．你較喜歡太陽還是月亮呢？(Y=太陽/N=月亮)" gquestion30))
 
(defrule gquestion30-y
 (gquestion30 y)
 =>
(read-from-web "問題二十三．你認為純友誼關係能夠在異性朋友在之間存在嗎？(y/n)" gquestion23))
 
(defrule gquestion23-n
 (gquestion23 n)
 =>
(read-from-web "問題十．請從下列兩種花中選擇你較喜歡的一種：(Y=向日葵/N=野菊花)" gquestion10))
 
(defrule gquestion15-n
 (gquestion15 n)
 =>
(read-from-web "問題二十一．你會經常收拾你的房間嗎？(y/n)" gquestion21))
 
(defrule gquestion24-n
 (gquestion24 n)
 =>
(read-from-web "問題三十一．你經常改變你的髮型嗎？(y/n)" gquestion31))
 
(defrule gquestion31-y
 (gquestion31 y)
 =>
(read-from-web "問題二十五．你對互聯網絡(Internet)有興趣嗎？(y/n)" gquestion25))
 
(defrule gquestion25-n
 (gquestion25 n)
 =>
(read-from-web "問題三十二．服務其他人令你覺得很忙碌嗎？(y/n)" gquestion32))
 
(defrule gquestion32-y
 (gquestion32 y)
 =>
(read-from-web "問題二十六．你較喜歡下列哪一種性格的人呢？(Y=運動型/N=成熟型)" gquestion26))
 
(defrule gquestion26-n
 (gquestion26 n)
 =>
(read-from-web "問題三十九．你對製造手工藝有興趣嗎？(y/n)" gquestion39))
 
(defrule gquestion39-y
 (gquestion39 y)
 =>
(read-from-web "問題三十三．你通常保持整齊的頭髮嗎？(y/n)" gquestion33))
 
(defrule gquestion33-y
 (gquestion33 y)
 =>
(read-from-web "問題二十七．你喜歡穿著及炫耀名牌時裝嗎？(y/n)" gquestion27))
 
(defrule gquestion27-y
 (gquestion27 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B型：藝術家型" crlf) 
 (printout t "     你關懷照料的性格總是令朋友們覺得你是他們的" crlf)
 (printout t "     大哥哥/大姐姐。朋友 們都很信任你；他們覺得" crlf)
 (printout t "     與你聊天很舒服並且是一種樂趣。通常一些年 "  crlf)
 (printout t "     紀比你小而且感情脆弱的異性都會受你吸引。"   crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion27-n
 (gquestion27 n)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D型：“迷人吸引”型"crlf) 
 (printout t "     在四個類型之中，你是最性感的一類。嫵媚迷人" crlf)
 (printout t "     的你很受朋友們的歡迎 而且更是眾人的集中點"  crlf)
 (printout t "     呢！可是，朋友們往往只是寵愛你的外貌；忠告" crlf)
 (printout t "     你不要過份信任異性的甜言蜜語！另外，希望你" crlf)
 (printout t "     能夠多些表現你的智慧 及主見，這樣你便能成"  crlf)
 (printout t "     為一個外在及內在美兼備的人。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion28-n
 (gquestion28 n)
 =>
(read-from-web "問題三十四．你有“烹飪恐懼症”嗎？(y/n)" gquestion34))
 
(defrule gquestion34-y
 (gquestion34 y)
 =>
(read-from-web "問題二十九．你通常會攜帶香水出街嗎？(y/n)" gquestion29))
 
(defrule gquestion29-n
 (gquestion29 n)
 =>
(read-from-web "問題三十五．你是否擁有很多裝飾品呢？(y/n)" gquestion35))
 
(defrule gquestion35-y
 (gquestion35 y)
 =>
(read-from-web "問題三十六．你喜歡在假期或節日期間購物嗎？(y/n)" gquestion36))
 
(defrule gquestion36-y
 (gquestion36 y)
 =>
(read-from-web "問題三十七．將來你希望製造雕像嗎？(y/n)" gquestion37))
 
(defrule gquestion37-y
 (gquestion37 y)
 =>
(read-from-web "問題三十二．服務其他人令你覺得很忙碌嗎？(y/n)" gquestion32))
 
(defrule gquestion32-n
 (gquestion32 n)
 =>
(read-from-web "問題三十八．你十分挑剔你內衣褲的款式嗎？(y/n)" gquestion38))
 
(defrule gquestion38-y
 (gquestion38 y)
 =>
(read-from-web "問題四十．你是否一個追隨時裝潮流的人呢？(y/n)" gquestion40))
 
(defrule gquestion40-y
 (gquestion40 y)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "C型：可愛小鳥依人型" crlf) 
 (printout t "     你是一個依賴及欠缺主見的人，因此異性朋友總" crlf)
 (printout t "     是覺得你是他們的小弟 弟?小妺妺。在四個類型" crlf)
 (printout t "     之中，你是最適合結婚的一類。你能成功地佔"   crlf)
 (printout t "     據配偶空閒的時間；你總希望你是眾人的集中"   crlf)
 (printout t "     點。“楚楚可憐”是你給 異性的印象，因此朋"  crlf)
 (printout t "     友們都熱心地保護及照顧你。穿著清潔整齊的衣" crlf)
 (printout t "     服 能令你更加受歡迎。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion30-n
 (gquestion30 n)
 =>
(read-from-web "問題二十四．你想學習烹飪嗎？(y/n)" gquestion30))
 
 (defrule gquestion31-n
 (gquestion31 n)
 =>
(read-from-web "問題三十七．將來你希望製造雕像嗎？(y/n)" gquestion37))
 
(defrule gquestion37-n
 (gquestion37 n)
 =>
 (read-from-web "問題三十八．你十分挑剔你內衣褲的款式嗎？(y/n)" gquestion38))
 
(defrule gquestion38-n
 (gquestion38 n)
 =>
(read-from-web "問題三十九．你對製造手工藝有興趣嗎？(y/n)" gquestion39))
 
(defrule gquestion39-n
 (gquestion39 n)
 =>
(read-from-web "問題二十七．你喜歡穿著及炫耀名牌時裝嗎？(y/n)" gquestion27))

(defrule gquestion33-n
 (gquestion33 n)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "C型：可愛小鳥依人型" crlf) 
 (printout t "     你是一個依賴及欠缺主見的人，因此異性朋友總" crlf)
 (printout t "     是覺得你是他們的小弟 弟?小妺妺。在四個類型" crlf)
 (printout t "     之中，你是最適合結婚的一類。你能成功地佔"   crlf)
 (printout t "     據配偶空閒的時間；你總希望你是眾人的集中"   crlf)
 (printout t "     點。“楚楚可憐”是你給 異性的印象，因此朋"  crlf)
 (printout t "     友們都熱心地保護及照顧你。穿著清潔整齊的衣" crlf)
 (printout t "     服 能令你更加受歡迎。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

 (defrule gquestion34-n
 (gquestion34 n)
 =>
(read-from-web "問題三十五．你是否擁有很多裝飾品呢？(y/n)" gquestion35))
 
(defrule gquestion35-n
 (gquestion35 n)
 =>
(read-from-web "問題三十七．將來你希望製造雕像嗎？(y/n)" gquestion37))

(defrule gquestion36-n
 (gquestion36 n)
 =>
(read-from-web "問題三十一．你經常改變你的髮型嗎？(y/n)" gquestion31))

(defrule gquestion40-n
 (gquestion40 n)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D型：“迷人吸引”型"crlf) 
 (printout t "     在四個類型之中，你是最性感的一類。嫵媚迷人" crlf)
 (printout t "     的你很受朋友們的歡迎 而且更是眾人的集中點"  crlf)
 (printout t "     呢！可是，朋友們往往只是寵愛你的外貌；忠告" crlf)
 (printout t "     你不要過份信任異性的甜言蜜語！另外，希望你" crlf)
 (printout t "     能夠多些表現你的智慧 及主見，這樣你便能成"  crlf)
 (printout t "     為一個外在及內在美兼備的人。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule gquestion4-y
  (gquestion4 y)
  =>
  (read-from-web "問題十一．你是否為一個有責任心的學生或職員呢？(y/n)" gquestion11))
 
(defrule two
 (w-y two)
 => 
 (read-from-web "選擇的是「你是什麼樣的人」心理測驗(y/n)?" two))

(defrule two-n
(two n)
 =>
 (printout t "結束，不玩了" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule two-y
 (two y)
 =>
 (printout t " " crlf)
 (read-from-web "問題一．您能將昨天晚上吃的東西全部記下來嗎？(y/n)" mquestion1))
 
(defrule mquestion1-y
 (mquestion1 y)
 =>
 (read-from-web "問題二．您認為戀人應該牽手？(y/n)" mquestion2))
 
(defrule mquestion2-y
 (mquestion2 y)
 =>
 (read-from-web "問題三．如果下輩子投胎，您會想當女人嗎？(y/n)" mquestion3))
 
(defrule mquestion3-y
 (mquestion3 y)
 =>
 (read-from-web "問題四．晚餐大部分在外面吃？(y/n)" mquestion4))
 
(defrule mquestion4-y
 (mquestion4 y)
 =>
 (read-from-web "問題八．對自己非常了解？(y/n)" mquestion8))
 
(defrule mquestion8-y
 (mquestion8 y)
 =>
 (read-from-web "問題十六．常常會想起以前交往的戀人和喜歡的人？(y/n)" mquestion16))
 
(defrule mquestion16-y
 (mquestion16 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "E型：你是一個重感情的人" crlf) 
 (printout t "     只要能讓你的心感到滿足的東西，" crlf)
 (printout t "     你都可以收藏，不管是在旅 行途中所買的物品，" crlf)
 (printout t "     或是朋友送給你的禮物，到國外住的飯店的紀 念品，或是風景明信片，" crlf)
 (printout t "     遊樂園的入場卷，貼紙，只要一看到那一 些東西，就能勾起你當時的回憶，" crlf)
 (printout t "     把這一些對你來說意義非凡的東 西拿出來給朋 友欣賞，分享，是你的一大樂趣。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule mquestion1-n
 (mquestion1 n)
 =>
 (read-from-web "問題五．看異性時，你會先看眼睛？(y/n)" mquestion5))
 
(defrule mquestion5-y
 (mquestion5 y)
 =>
 (read-from-web "問題六．你現在有在學習某種課程？(y/n)" mquestion6))
 
(defrule mquestion6-y
 (mquestion6 y)
 =>
 (read-from-web "問題七．只要有同學會你一定會參加？(y/n)" mquestion7))
 
(defrule mquestion7-y
 (mquestion7 y)
 =>
 (read-from-web "問題八．對自己非常了解？(y/n)" mquestion8))
 
(defrule mquestion2-n
 (mquestion2 n)
 =>
 (read-from-web "問題六．你現在有在學習某種課程？(y/n)" mquestion6))

(defrule mquestion6-n
 (mquestion6 n)
 =>
 (read-from-web "問題十一．有買過股票嗎？(y/n)" mquestion11))
 
(defrule mquestion11-y
 (mquestion11 y)
 =>
 (read-from-web "問題十五．你對現在的生活感到滿足嗎？(y/n)" mquestion15))
 
(defrule mquestion15-y
 (mquestion15 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D型：你是一個很時尚的人" crlf) 
 (printout t "     你很有流行的概念，對新奇的事物都非常關心。" crlf)
 (printout t "     追求時髦的你 最適合的興趣就是逛街選購一些服飾，配件之類的東西。" crlf)
 (printout t "     帽子，鞋子，戒指耳環等，只要是能讓你更美的東西，或是現在當紅的東西，" crlf)
 (printout t "     你都非常地有興趣，而且你對流行的知識也很受到大家的肯定囉。 " crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule mquestion3-n
 (mquestion3 n)
 =>
 (read-from-web "問題七．只要有同學會你一定會參加？(y/n)" mquestion7))
 
(defrule mquestion7-n
 (mquestion7 n)
 =>
 (read-from-web "問題十一．有買過股票嗎？(y/n)" mquestion11))
 
(defrule mquestion11-n
 (mquestion11 n)
 =>
 (read-from-web "問題十二．在餐廳吃好吃的食物，也會想回家自己動手做做看？(y/n)" mquestion12))
 
(defrule mquestion12-y
 (mquestion12 y)
 =>
 (read-from-web "問題十五．你對現在的生活感到滿足嗎？(y/n)" mquestion15))
 
(defrule mquestion15-n
 (mquestion15 n)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "C型：你是一個熱愛寵物的人" crlf)
 (printout t "     你非常喜歡小動物，不管是貓或狗等，你都愛的不得了。" crlf)
 (printout t "     一有空你就會將你的時間全都花在照顧動物上面，幫動物洗澡打扮，帶他們去散步。" crlf)
 (printout t "     在外面看到棄貓棄狗你也會義不容辭的抱回家，收養他們。" crlf)
 (printout t "     另外對充滿赤子之心的你來說，買玩具和打電動也是很速配。 " crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
(defrule mquestion4-n
 (mquestion4 n)
 =>
 (read-from-web "問題七．只要有同學會你一定會參加？(y/n)" mquestion7))
 
(defrule mquestion5-n
 (mquestion5 n)
 =>
 (read-from-web "問題九．你認為車禍很可怕？(y/n)" mquestion9))
 
(defrule mquestion9-y
 (mquestion9 y)
 =>
 (read-from-web "問題十三．早上花20分鐘以上打扮自己？(y/n)" mquestion13))
 
(defrule mquestion13-y
 (mquestion13 y)
 =>
 (read-from-web "問題十四．你會開車嗎？(y/n)" mquestion14))
 
(defrule mquestion14-y
 (mquestion14 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B型：你是一個注重生活情趣的人" crlf)
 (printout t "     持家型的你，最適合的興趣就是做一些能佈置環境的手工藝品。" crlf)
 (printout t "     你很喜歡看見自己所居住的房間被自己的成品裝飾的美輪美奐，" crlf)
 (printout t "     除了很有成就感之外，你會覺得很開心。不管是民俗藝品，裁縫編織，" crlf)
 (printout t "     娃娃等等，你做起來都會很得心應手的，樂在其中。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
(defrule mquestion8-n
 (mquestion8 n)
 =>
 (read-from-web "問題十二．在餐廳吃好吃的食物，也會想回家自己動手做做看？(y/n)" mquestion12))
 
(defrule mquestion12-n
 (mquestion12 n)
 =>
 (read-from-web "問題十六．常常會想起以前交往的戀人和喜歡的人？(y/n)" mquestion16))
 
(defrule mquestion16-n
 (mquestion16 n)
  =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D型：你是一個很時尚的人" crlf) 
 (printout t "     你很有流行的概念，對新奇的事物都非常關心。" crlf)
 (printout t "     追求時髦的你 最適合的興趣就是逛街選購一些服飾，配件之類的東西。" crlf)
 (printout t "     帽子，鞋子，戒指耳環等，只要是能讓你更美的東西，或是現在當紅的東西，" crlf)
 (printout t "     你都非常地有興趣，而且你對流行的知識也很受到大家的肯定囉。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
(defrule mquestion13-n
 (mquestion13 n)
 =>
 (read-from-web "問題十．你吸煙嗎？(y/n)" mquestion10))
 
(defrule mqeustion10-y
 (mquestion10 y)
 =>
 (read-from-web "問題十一．有買過股票嗎？(y/n)" mquestion11))
 
(defrule mquestion10-n
 (mquestion10 n)
 =>
 (read-from-web "問題十四．你會開車嗎？(y/n)" mquestion14))

(defrule mquestion14-n
 (mquestion14 n)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "A型：你是一個很實際的人" crlf)
 (printout t "     最適合你的休閒活動就是去收集或購買那些可以增值的東西。" crlf)
 (printout t "     不管是五年後或是十年後才能看到回饋的東西，" crlf)
 (printout t "     只要是既能陶冶身 心又能兼顧儲蓄的活動，你絕對會非常投入。" crlf)
 (printout t "     像收集郵票啦，陶瓷品，美術品等都是不錯的興趣。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
 (defrule three
 (w-y three)
 => 
 (read-from-web "測驗三:亂世英雄心理測驗(y/n)?" three))

(defrule three-n
(three n)
 =>
 (printout t "結束，不玩了" crlf)
 (printout t crlf ?*homepage* crlf))



 (defrule three-y
 (three y)
 =>
 (printout t " " crlf)
 (read-from-web "1.假如你現在有一筆錢去建一座夢寐以求的別墅，你會選擇(y=西班牙式平房/n=古堡式大屋)" nquestion1))
 
(defrule nquestion1-y
 (nquestion1 y)
 =>
 (read-from-web "5.緊張時，你會(y=咬手指/n=深呼吸)" nquestion5))
 
(defrule nquestion5-y
 (nquestion5 y)
 =>
(read-from-web "6.如果可能的話，每朝都想一直睡下去，不想起床返工？(y/n)" nquestion6))
 
 (defrule nquestion6-y
 (nquestion6 y)
 =>
 (read-from-web "7.上班永遠遲到十五分鐘？(y/n)" nquestion7))
 
 (defrule nquestion7-y
 (nquestion7 y)
=>
(read-from-web "10.在路上開車時，有輛車自後追上來與你並行，你認為那輛車是？(y=貨車/n=開篷跑車)" nquestion10))
 
(defrule nquestion10-y
 (nquestion10 y)
=>
(read-from-web "9.同事會有獨贏賽馬貼士，你會否下注？(y/n)" nquestion9))
 
 (defrule nquestion9-y
 (nquestion9 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "C型：衝動型" crlf) 
 (printout t "     你為人觸覺敏銳，廣結人緣，做事幹勁十足，學(野)又快上手，" crlf)
 (printout t "     但偏偏衰衝動，而且好易被小小勝利沖昏頭腦，所以現時想事" crlf)
 (printout t "     業有突破，應該找個有經驗兼頭腦冷靜的人合作。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))
 
 (defrule nquestion1-n
 (nquestion1 n)
 =>
 (read-from-web "2.約朋友食飯，你會怎樣點菜？(y=點跟別人同樣的菜/n=先問侍應今天有什麼好介紹後再點菜)" nquestion2))
 
(defrule nquestion2-y
 (nquestion2 y)
 =>
(read-from-web "3.朋友準備送一樣東西賀你升職，你希望得到？(y=徐若瑄寫真掛曆/n=得B座檯鐘)" nquestion9))
 
(defrule nquestion3-y
 (nquestion3 y)
 =>
(read-from-web "4.上司出錯，你會(y=告訴他/n=不作聲)" nquestion4))
 
(defrule nquestion4-y
 (nquestion4 y)
 =>
(read-from-web "5.緊張時，你會(y=咬手指/n=深呼吸)" nquestion5))
 
(defrule nquestion5-n
 (nquestion5 n)
 =>
(read-from-web "10.在路上開車時，有輛車自後追上來與你並行，你認為那輛車是？(y=貨車/n=開篷跑車)" nquestion10))
 
(defrule nquestion10-n
 (nquestion10 n)
=>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D型：辦大事型" crlf) 
 (printout t "     你有冷靜而靈活的頭腦，超人的耐力和專業的知識，你未必聰絕頂，" crlf)
 (printout t "     ，卻有嘗試精神，並且知人善任，知道自己的優點和缺點，" crlf)
 (printout t "     暫時欠的只是機會和好拍檔，但只要不氣餒，你一定可以做逆市奇葩。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule nquestion2-n
 (nquestion2 n)
 =>
(read-from-web "4.上司出錯，你會(y=告訴他/n=不作聲)" nquestion4))
 
(defrule nquestion4-n
 (nquestion4 n)
 =>
(read-from-web "8.當眾被上司大罵，你會(y=扮無事，但內心覺得好驚/n=向上司道歉，然後心裡盤算如何解決)" nquestion8))
 
(defrule nquestion8-y
 (nquestion8 y)
 =>
(read-from-web "12.假設真的被外星人擄走，你會否希望他們繼續收留你？(y/n)" nquestion12))
 
(defrule nquestion12-y
 (nquestion12 y)
 =>
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B型：審慎型" crlf) 
 (printout t "     你雖然閱歷豐富，頭腦清晰，奈何性格太謹慎，" crlf)
 (printout t "     雖然未至於船頭驚鬼船尾驚賊，但有時你未免會杞人憂天，" crlf)
 (printout t "     但願你考慮完畢，社會已經好好景。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule nquestion3-n
 (nquestion3 n)
 =>
(read-from-web "5.緊張時，你會(y=咬手指/n=深呼吸)" nquestion5))

(defrule nquestion6-n
 (nquestion6 n)
 =>
(read-from-web "8.當眾被上司大罵，你會(y=扮無事，但內心覺得好驚/n=向上司道歉，然後心裡盤算如何解決)" nquestion8))
 
(defrule nquestion8-n
 (nquestion8 n)
 =>
(read-from-web "11.如果你可以變成任何人，你最想變成？(y=任志剛/n=索羅斯)" nquestion11))
 
(defrule nquestion11-y
 (nquestion11 y)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "B型：審慎型" crlf) 
 (printout t "     你雖然閱歷豐富，頭腦清晰，奈何性格太謹慎，" crlf)
 (printout t "     雖然未至於船頭驚鬼船尾驚賊，但有時你未免會杞人憂天，" crlf)
 (printout t "     但願你考慮完畢，社會已經好好景。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule nquestion7-n
 (nquestion7 n)
=>
(read-from-web "11.如果你可以變成任何人，你最想變成？(y=任志剛/n=索羅斯)" nquestion11))
 
(defrule nquestion11-n
 (nquestion11 n)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "D型：辦大事型" crlf) 
 (printout t "     你有冷靜而靈活的頭腦，超人的耐力和專業的知識，你未必聰絕頂，" crlf)
 (printout t "     ，卻有嘗試精神，並且知人善任，知道自己的優點和缺點，" crlf)
 (printout t "     暫時欠的只是機會和好拍檔，但只要不氣餒，你一定可以做逆市奇葩。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule nquestion9-n
 (nquestion9 n)
 =>
(printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t "A型：畏首畏尾型" crlf) 
 (printout t "     婉轉的會話你安守本分，直接不客氣的便叫畏首畏尾，" crlf)
 (printout t "     連食魚蛋粉都驚生Cancer，希望你呢一世都唔" crlf)
 (printout t "     會有太大改變，免得你頂唔住。" crlf)
 (printout t "----------------------------------------------------------------------------------------" crlf)
 (printout t crlf ?*homepage* crlf))

(defrule nquestion12-n
 (nquestion12 n)
 =>
(read-from-web "11.如果你可以變成任何人，你最想變成？(y=任志剛/n=索羅斯)" nquestion11))



 

