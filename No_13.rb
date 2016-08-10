# encoding: utf-8
class Words
  @@count = 0

  def self.count
    @@count
  end
  def initialize
    @@count += 1
  end
end
puts "中国語ゲームスタート！exitで中断。"
puts "何課を学習しますか？半角数字を入力してください"
puts "1: 13課,2: 14課,3: 15課,4: 16課"
top = gets.chomp.to_i
if top == 1
puts "ようこそ13課へ！"    
puts "なにをしますか？半角数字を入力してください"
puts "menu 1: 単語, 2: 文章(穴うめ), 3: 文章(全文)"
menu = gets.chomp.to_i
case menu
when 1
puts "単語"


  words = { "春假" => "春休み[chunjia]", 
          "计划" => "計画[jihua]", 
          "安排" => "段取りする[anpai]", 
          "物价" => "物価[wujia]", 
          "努力" => "努力する[nuli]", 
          "打工" => "アルバイトする[dagong]", 
          "为什么" => "なぜ、どうして[wei shenme]", 
          "因为" => "〜なので[yinwei]", 
          "便宜" => "（値が）安い[pianyi]", 
          "放心" => "安心する[fangxin]", 
          "存钱" => "お金を貯める[cun qian]", 
          "想好" => "よく考える[xianghao]", 
          "特别" => "特に、とりわけ[tebie]", 
          "方便" => "都合が良い、便利だ[fangbian]", 
          "发伊妹儿" => "メールを送る[fa yimeir]"
        }
       
        wordsh = Hash[words.to_a.sample(33)] # いったんarrayにしてsampleした後、hashに戻す 

loop_count = 0

correct_count = 0
 
wordsh.each do |key,value|
  puts "「#{value}」に対応する単語を入力してください。"

  answer = gets.chomp.to_s

  if answer == "exit"
     break
  elsif answer == key
     puts "\e[32m 正解なのです((^_^/\n"
     puts "\e[0m \n"
     correct_count += 1
  else
     puts "\e[31m 不正解です((>_<\n"
     puts "正解は、#{key}なのです((>_<"
     puts "\e[0m \n"
  end
  loop_count += 1
end

def percentage (a,b)
   if b == 0
     return 0
   end
 a*100/b
end

def icorrect (c,d)
  d - c 
end

puts "\e[32m あなたは#{icorrect(correct_count,loop_count)}こ間違えちゃったのです>_^\n"
puts "あなたの正解率は#{percentage(correct_count,loop_count)}パーセントなのです>_^/"
if percentage(correct_count,loop_count) == 100
  puts "///^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
  puts "//^_^/^_^/やったねパーフェクトなのです/^_^/^_^//"
  puts "/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
end
when 2

  puts "文章穴うめ"
  puts "複数()がある場合,左から順に ,(コンマ)を手書きパッドで入力しながら答えてください"
  puts "例：　春,夏"
  sentence_h = {
        "()你们有什么()吗？(春休みあなた達は何か計画がありますか？)" => "春假，计划",
        "我们()想好(私達は今の所まだちゃんと考えていません)" => "还没",
        "()没有什么()的话，和我去中国吧(もしなにも手配していなかったら、私と中国へ行きましょう)" => "要是，安排",
        "我们()现在开始，()努力打工(私達は今から頑張ってアルバイトを始めなければなりません)" => "从，得",
        "()得打工？(どうしてアルバイトをしなければならないのですか？)" => "为什么",
        "()我们得存钱(私達はお金を貯めなくてはならないからです)" => "因为",
        "中国()很()(中国の物価は安いです)" => "物价，便宜",
        "真的吗？()我就()了(本当ですか？それなら安心しました)" => "那，放心",
        "()你想去哪儿玩儿玩儿吗？(春休みにはあなたはどこかにちょっと遊びに行きたいですか？)" => "春假",
        "你们有什么()吗？(あなた達何か質問ありますか？)" => "问题",
        "()明天天气好的话，我们就去()吧(もし明日天気が良かったら、私達動物園に行きましょう)" => "要是，动物园",
        "()不方便的话，就给我打电话吧(もし都合がわるかったら、私に電話をしてください)" => "要是",
        "()你学汉语？(なぜあなたは中国語を勉強するのですか？)" => "为什么",
        "()我很想去中国(私は中国にとても行きたいからです)" => "因为",
        "()你不去滑雪？(なぜあなたはスキーに行かないのですか？)" => "为什么",
        "()我不会滑雪(スキーができないからです。)" => "因为",
        "我()住院吗？不要(私は入院しなければなりませんか？必要ないです)" => "得",
        "()去中国旅行，我得努力学汉语(中国に旅行に行くために、私は頑張って中国語を勉強しなければなりません)" => "为了"
  }
  sentence_hs = Hash[sentence_h.to_a.sample(18)]
  loop_count = 0

correct_count = 0
 
sentence_hs.each do |key,value|
  puts "「#{key}」の()に対応する単語を入力してください。"

  answer = gets.chomp.to_s

  if answer == "exit"
     break
  elsif answer == value
     puts "\e[32m 正解なのです((^_^/\n"
     puts "\e[0m \n"
     correct_count += 1
  else
     puts "\e[31m 不正解です((>_<\n"
     puts "正解は、#{value}なのです((>_<"
     puts "\e[0m \n"
  end
  loop_count += 1
end

def percentage (a,b)
   if b == 0
     return 0
   end
 a*100/b
end

def icorrect (c,d)
  d - c 
end

puts "\e[32m あなたは#{icorrect(correct_count,loop_count)}こ間違えちゃったのです>_^\n"
puts "あなたの正解率は#{percentage(correct_count,loop_count)}パーセントなのです>_^/"
if percentage(correct_count,loop_count) == 100
  puts "///^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
  puts "//^_^/^_^/やったねパーフェクトなのです/^_^/^_^//"
  puts "/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
end
when 3

  puts "文章全文"
  puts ",や？など記号も手書きパッドで入力してください"
  puts "。はいりません"
  sentence_all = {
        "春假你们有什么计划吗？" => "春休みあなた達は何か計画がありますか？",
        "我们还没想好" => "私達は今の所まだちゃんと考えていません",
        "要是没有什么安排的话，和我去中国吧" => "もしなにも手配していなかったら、私と中国へ行きましょう",
        "我们从现在开始，得努力打工" => "私達は今から頑張ってアルバイトを始めなければなりません",
        "为什么得打工？" => "どうしてアルバイトをしなければならないのですか？",
        "因为我们得存钱" => "私達はお金を貯めなくてはならないからです",
        "中国物价很便宜" => "中国の物価は安いです",
        "真的吗？那我就放心了" => "本当ですか？それなら安心しました",
        "春假你想去哪儿玩儿玩儿吗？" => "春休みにはあなたはどこかにちょっと遊びに行きたいですか？",
        "你们有什么问题吗？" => "1あなた達何か質問ありますか？",
        "要是明天天气好的话，我们就去动物园吧" => "1もし明日天気が良かったら、私達動物園に行きましょう",
        "要是不方便的话，就给我打电话吧" => "もし都合がわるかったら、私に電話をしてください",
        "为什么你学汉语？" => "なぜあなたは中国語を勉強するのですか？",
        "因为我很想去中国" => "私は中国にとても行きたいからです",
        "为什么你不去滑雪？" => "なぜあなたはスキーに行かないのですか？",
        "因为我不会滑雪" => "スキーができないからです。",
        "我得住院吗？不要" => "私は入院しなければなりませんか？",
        "为了去中国旅行，我得努力学汉语" => "中国に旅行に行くために、私は頑張って中国語を勉強しなければなりません"
  }
  sentence_alls = Hash[sentence_all.to_a.sample(18)]
  loop_count = 0

correct_count = 0
 
sentence_alls.each do |key,value|
  puts "「#{value}」に対応する文章を入力してください。"

  answer = gets.chomp.to_s

  if answer == "exit"
     break
  elsif answer == key
     puts "\e[32m 正解なのです((^_^/\n"
     puts "\e[0m \n"
     correct_count += 1
  else
     puts "\e[31m 不正解です((>_<\n"
     puts "正解は、#{key}なのです((>_<"
     puts "\e[0m \n"
  end
  loop_count += 1
end

def percentage (a,b)
   if b == 0
     return 0
   end
 a*100/b
end

def icorrect (c,d)
  d - c 
end

puts "\e[32m あなたは#{icorrect(correct_count,loop_count)}こ間違えちゃったのです>_^\n"
puts "あなたの正解率は#{percentage(correct_count,loop_count)}パーセントなのです>_^/"
 if percentage(correct_count,loop_count) == 100
  puts "///^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
  puts "//^_^/^_^/やったねパーフェクトなのです/^_^/^_^//"
  puts "/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
elsif percentage(correct_count,loop_count).between?(50, 99)
  puts "まだまだなのです"
  puts "ファイトなのです"
else
  puts "あなたはこのままじゃダメなのです、、、"
  end
 end

elsif top == 2
  puts "ようこそ14課へ！"
  puts "なにをしますか？半角数字を入力してください"
puts "menu 1: 単語, 2: 文章(穴うめ), 3: 文章(全文)"
  a14 = gets.chomp.to_i
     case a14
     when 1
       puts "単語"

  words = { 
       "机场" => "空港[jichang]",
       "把" => "〜を[ba]",
       "大巴" => "バス[daba]",
       "倒车" => "乗り換える[daoche]",
       "出租汽车" => "タクシー[chuzu qian]",
       "行李" => "荷物[xingli]",
       "票" => "切符[piao]",
       "多少钱" => "いくら？[duoshao qian]",
       "清楚" => "はっきりしている[qingchu]",
       "垫" => "建て替える[dian]",
       "来到" => "〜に到着する[laidao]",
       "终于" => "ついに[zhongyu]",
       "先" => "さきに[xian]",
       "停在" => "〜に停車する,とまる[tingzai]",
       "不太" => "あまり〜でない[butai]"
        }
       
        wordsh = Hash[words.to_a.sample(33)] # いったんarrayにしてsampleした後、hashに戻す 

loop_count = 0

correct_count = 0
 
wordsh.each do |key,value|
  puts "「#{value}」に対応する単語を入力してください。"

  answer = gets.chomp.to_s

  if answer == "exit"
     break
  elsif answer == key
     puts "\e[32m 正解なのです((^_^/\n"
     puts "\e[0m \n"
     correct_count += 1
  else
     puts "\e[31m 不正解です((>_<\n"
     puts "正解は、#{key}なのです((>_<"
     puts "\e[0m \n"
  end
  loop_count += 1
end

def percentage (a,b)
   if b == 0
     return 0
   end
 a*100/b
end

def icorrect (c,d)
  d - c 
end

puts "\e[32m あなたは#{icorrect(correct_count,loop_count)}こ間違えちゃったのです>_^\n"
puts "あなたの正解率は#{percentage(correct_count,loop_count)}パーセントなのです>_^/"
if percentage(correct_count,loop_count) == 100
  puts "///^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
  puts "//^_^/^_^/やったねパーフェクトなのです/^_^/^_^//"
  puts "/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
end
     when 2
       puts "文章穴うめ"

  words = { 
        }
       
        wordsh = Hash[words.to_a.sample(33)] # いったんarrayにしてsampleした後、hashに戻す 

loop_count = 0

correct_count = 0
 
wordsh.each do |key,value|
  puts "「#{value}」に対応する単語を入力してください。"

  answer = gets.chomp.to_s

  if answer == "exit"
     break
  elsif answer == key
     puts "\e[32m 正解なのです((^_^/\n"
     puts "\e[0m \n"
     correct_count += 1
  else
     puts "\e[31m 不正解です((>_<\n"
     puts "正解は、#{key}なのです((>_<"
     puts "\e[0m \n"
  end
  loop_count += 1
end

def percentage (a,b)
   if b == 0
     return 0
   end
 a*100/b
end

def icorrect (c,d)
  d - c 
end

puts "\e[32m あなたは#{icorrect(correct_count,loop_count)}こ間違えちゃったのです>_^\n"
puts "あなたの正解率は#{percentage(correct_count,loop_count)}パーセントなのです>_^/"
if percentage(correct_count,loop_count) == 100
  puts "///^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
  puts "//^_^/^_^/やったねパーフェクトなのです/^_^/^_^//"
  puts "/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
end
     when 3
       puts "文章全文"

  words = { 
          "" => "",
          "" => "",
          "" => "",
          "" => "",
          "" => "",
          "" => "",
          "" => "",
          "" => "",
          "" => "",
          "" => ""
        }
       
        wordsh = Hash[words.to_a.sample(33)] # いったんarrayにしてsampleした後、hashに戻す 

loop_count = 0

correct_count = 0
 
wordsh.each do |key,value|
  puts "「#{value}」に対応する単語を入力してください。"

  answer = gets.chomp.to_s

  if answer == "exit"
     break
  elsif answer == key
     puts "\e[32m 正解なのです((^_^/\n"
     puts "\e[0m \n"
     correct_count += 1
  else
     puts "\e[31m 不正解です((>_<\n"
     puts "正解は、#{key}なのです((>_<"
     puts "\e[0m \n"
  end
  loop_count += 1
end

def percentage (a,b)
   if b == 0
     return 0
   end
 a*100/b
end

def icorrect (c,d)
  d - c 
end

puts "\e[32m あなたは#{icorrect(correct_count,loop_count)}こ間違えちゃったのです>_^\n"
puts "あなたの正解率は#{percentage(correct_count,loop_count)}パーセントなのです>_^/"
if percentage(correct_count,loop_count) == 100
  puts "///^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
  puts "//^_^/^_^/やったねパーフェクトなのです/^_^/^_^//"
  puts "/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
end
     end
elsif top == 3
  puts "ようこそ15課へ！"
  puts "なにをしますか？半角数字を入力してください"
puts "menu 1: 単語, 2: 文章(穴うめ), 3: 文章(全文)"
   b15 = gets.chomp.to_i
    case b15
     when 1
       puts "test1"
     when 2
       puts "test2"
     when 3
       puts "test3"
    end
elsif top == 4
  puts "ようこそ16課へ！"
  puts "なにをしますか？半角数字を入力してください"
puts "menu 1: 単語, 2: 文章(穴うめ), 3: 文章(全文)"
  c16 = gets.chomp.to_i
   case c16
     when 1
       puts "単語"

  words = { 
        }
       
        wordsh = Hash[words.to_a.sample(33)] # いったんarrayにしてsampleした後、hashに戻す 

loop_count = 0

correct_count = 0
 
wordsh.each do |key,value|
  puts "「#{value}」に対応する単語を入力してください。"

  answer = gets.chomp.to_s

  if answer == "exit"
     break
  elsif answer == key
     puts "\e[32m 正解なのです((^_^/\n"
     puts "\e[0m \n"
     correct_count += 1
  else
     puts "\e[31m 不正解です((>_<\n"
     puts "正解は、#{key}なのです((>_<"
     puts "\e[0m \n"
  end
  loop_count += 1
end

def percentage (a,b)
   if b == 0
     return 0
   end
 a*100/b
end

def icorrect (c,d)
  d - c 
end

puts "\e[32m あなたは#{icorrect(correct_count,loop_count)}こ間違えちゃったのです>_^\n"
puts "あなたの正解率は#{percentage(correct_count,loop_count)}パーセントなのです>_^/"
if percentage(correct_count,loop_count) == 100
  puts "///^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
  puts "//^_^/^_^/やったねパーフェクトなのです/^_^/^_^//"
  puts "/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
end
     when 2
       puts "単語"

  words = { 
        }
       
        wordsh = Hash[words.to_a.sample(33)] # いったんarrayにしてsampleした後、hashに戻す 

loop_count = 0

correct_count = 0
 
wordsh.each do |key,value|
  puts "「#{value}」に対応する単語を入力してください。"

  answer = gets.chomp.to_s

  if answer == "exit"
     break
  elsif answer == key
     puts "\e[32m 正解なのです((^_^/\n"
     puts "\e[0m \n"
     correct_count += 1
  else
     puts "\e[31m 不正解です((>_<\n"
     puts "正解は、#{key}なのです((>_<"
     puts "\e[0m \n"
  end
  loop_count += 1
end

def percentage (a,b)
   if b == 0
     return 0
   end
 a*100/b
end

def icorrect (c,d)
  d - c 
end

puts "\e[32m あなたは#{icorrect(correct_count,loop_count)}こ間違えちゃったのです>_^\n"
puts "あなたの正解率は#{percentage(correct_count,loop_count)}パーセントなのです>_^/"
if percentage(correct_count,loop_count) == 100
  puts "///^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
  puts "//^_^/^_^/やったねパーフェクトなのです/^_^/^_^//"
  puts "/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
end
     when 3
       puts "単語"

  words = { 
        }
       
        wordsh = Hash[words.to_a.sample(33)] # いったんarrayにしてsampleした後、hashに戻す 

loop_count = 0

correct_count = 0
 
wordsh.each do |key,value|
  puts "「#{value}」に対応する単語を入力してください。"

  answer = gets.chomp.to_s

  if answer == "exit"
     break
  elsif answer == key
     puts "\e[32m 正解なのです((^_^/\n"
     puts "\e[0m \n"
     correct_count += 1
  else
     puts "\e[31m 不正解です((>_<\n"
     puts "正解は、#{key}なのです((>_<"
     puts "\e[0m \n"
  end
  loop_count += 1
end

def percentage (a,b)
   if b == 0
     return 0
   end
 a*100/b
end

def icorrect (c,d)
  d - c 
end

puts "\e[32m あなたは#{icorrect(correct_count,loop_count)}こ間違えちゃったのです>_^\n"
puts "あなたの正解率は#{percentage(correct_count,loop_count)}パーセントなのです>_^/"
if percentage(correct_count,loop_count) == 100
  puts "///^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
  puts "//^_^/^_^/やったねパーフェクトなのです/^_^/^_^//"
  puts "/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
end
    end
else
  puts "エラー"
end