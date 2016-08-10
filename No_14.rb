# encoding: utf-8
class Points
  @@count = 0
  def initialize(correct,loops)
    @correct = correct
    @loops = loops
    @@count += 1
  end
  def poin
    if @loops == 0
     return 0
    end
    icorrect = @loops-@correct
    percent = @correct*100/@loops
    if icorrect.between?(1,40)
       puts "\e[32m あなたは#{icorrect}こ間違えちゃったのです>_^\n"
    end
    puts "あなたの正解率は#{percent}パーセントなのです>_^/"
    if percent == 100
       puts "///^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
       puts "//^_^/^_^/やったねパーフェクトなのです/^_^/^_^//"
       puts "/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^/^_^///"
    elsif percent.between?(50, 99)
       puts "まだまだなのです"
       puts "ファイトなのです"
    else
       puts "あなたはこのままじゃダメなのです、、、"
    end
  end
  def self.count
    @@count
  end
end

class Resout
  def initialize(keys,answers)
    @keys = keys
    @answers = answers
  end
  def ans 
      if @answers == @keys
          puts "\e[32m 正解なのです((^_^/\n"
          puts "\e[0m \n"
          $correct_count += 1
      else
          puts "\e[31m 不正解です((>_<\n"
          puts "正解は、#{@keys}なのです((>_<"
          puts "\e[0m \n"
      end
      $loop_count += 1
  end
end




# 変数宣言

$loop_count = 0
$correct_count = 0

while true

puts "----------------------------------------------"
puts "中国語ゲームスタート！exitで中断。"
puts "----------------------------------------------"
puts "何課を学習しますか？"
puts "半角数字を入力してください"
puts "----------------------------------------------"
puts "1: 13課,2: 14課,3: 15課(工事中),4: 16課"
puts "----------------------------------------------"
top = gets.chomp.to_i
if top == 1
  puts "ようこそ13課へ！"    
  puts "なにをしますか？半角数字を入力してください"
  puts "----------------------------------------------"
  puts "menu 1: 単語, 2: 文章(穴うめ), 3: 文章(全文)"
  puts "----------------------------------------------"
  menu = gets.chomp.to_i
  case menu
  when 1
    puts "------"
    puts "単語"
    puts "------"
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
       
        wordsh = Hash[words.to_a.sample(33)] 
    wordsh.each do |key,value|
        puts "「#{value}」に対応する単語を入力してください。"
        answer = gets.chomp.to_s
        if answer == "exit"
          break
        end
        my_answer = Resout.new(key,answer)
        my_answer.ans
    end
      my_point = Points.new($correct_count,$loop_count)
      my_point.poin
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
    sentence_hs.each do |key,value|
    puts "「#{key}」の()に対応する単語を入力してください。"
    answer = gets.chomp.to_s
        if answer == "exit"
          break
        end
        my_answer = Resout.new(value,answer)
        my_answer.ans
  end

  my_point = Points.new($correct_count,$loop_count)
  my_point.poin
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
  
  sentence_alls.each do |key,value|
  puts "「#{value}」に対応する文章を入力してください。"

  answer = gets.chomp.to_s

        if answer == "exit"
          break
        end
        my_answer = Resout.new(key,answer)
        my_answer.ans
  end

  my_point = Points.new($correct_count,$loop_count)
  my_point.poin

  end
elsif top == 2
  puts "ようこそ14課へ！"
  puts "なにをしますか？半角数字を入力してください"
  puts "----------------------------------------------"
  puts "menu 1: 単語, 2: 文章(穴うめ), 3: 文章(全文)"
  puts "----------------------------------------------"
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
       
        wordsh = Hash[words.to_a.sample(15)] 

 
  wordsh.each do |key,value|
   puts "「#{value}」に対応する単語を入力してください。"

   answer = gets.chomp.to_s

        if answer == "exit"
          break
        end
        my_answer = Resout.new(key,answer)
        my_answer.ans
  end
  my_point = Points.new($correct_count,$loop_count)
  my_point.poin
     when 2
       puts "文章穴うめ"

  words = { 
          "我()来到中国了(私はついに中国にやってきました)" => "终于",
          "去市里()什么车？(市内に行くにはなにに乗るのですか？)" => "坐",
          "我们()去市里(私達はバスに乗って市内に行きます)" => "坐大巴",
          "坐大巴()直接去饭店吗？(バスに乗って直接ホテルに行けますか？)" => "能",
          "去不了。下了大巴要()出租汽车(行けません。バスを降りてからタクシーに乗り換えなければなりません)" => "倒",
          "你()行李看好，我先去买票(あなたは荷物を見ていてください、渡した先に切符を買いに行きます)" => "把",
          "()也张？(一枚いくらですか？)" => "多少钱",
          "没关系。我先()上吧(大丈夫です。僕が先に建て替えましょう)" => "垫",
          "他说的汉语，我()(彼が話す中国語、私は聞いて理解できません)" => "听不懂",
          "黑板上的字，你们看得()吗？(黒板の字、君たちははっきり見えますか？)" => "清楚",
          "晚上十点以前你们()吗？(夜１０時前にあなた達は帰ってこられますか？)" => "回得来",
          "我()今天的工作做完了(私は今日の仕事をやり終えました)" => "把",
          "你()这个机会给我吧(あなたは私にこのチャンスをください)" => "把",
          "我()你的书包带来(私はあなたのかばんをもってきませんでした)" => "没把",
          "他()人民币换成日元(彼は人民元を日本円に換えたがっています)" => "要把",
          "这个()？(これはいくらですか？)" => "多少钱",
          "四百七十()(一つ４７０元です)" => "块也个",
          "我有两千()(私は２０００元ほど持っています)" => "块左右"
        }
       
        wordsh = Hash[words.to_a.sample(33)] 

 
  wordsh.each do |key,value|
  puts "「#{key}」に対応する単語を入力してください。"

  answer = gets.chomp.to_s

  if answer == "exit"
          break
        end
        my_answer = Resout.new(value,answer)
        my_answer.ans
  end

  my_point = Points.new($correct_count,$loop_count)
  my_point.poin


  when 3
       puts "文章全文"

   sentence_all = { 
          "我终于来到中国了" => "私はついに中国にやってきました",
          "去市里坐什么车？" => "市内に行くにはなにに乗るのですか？",
          "我们坐大巴去市里" => "私達はバスに乗って市内に行きます",
          "坐大巴能直接去饭店吗？" => "バスに乗って直接ホテルに行けますか？",
          "去不了。下了大巴要倒出租汽车" => "行けません。バスを降りてからタクシーに乗り換えなければなりません",
          "你把行李看好，我先去买票" => "あなたは荷物を見ていてください、渡した先に切符を買いに行きます",
          "多少钱也张？" => "一枚いくらですか？",
          "没关系。我先垫上吧" => "大丈夫です。僕が先に建て替えましょう",
          "他说的汉语，我听不懂" => "彼が話す中国語、私は聞いて理解できません",
          "黑板上的字，你们看得清楚吗？" => "黒板の字、君たちははっきり見えますか？",
          "晚上十点以前你们回得来吗？" => "夜１０時前にあなた達は帰ってこられますか？",
          "我把今天的工作做完了" => "私は今日の仕事をやり終えました",
          "你把这个机会给我吧" => "あなたは私にこのチャンスをください",
          "我没把你的书包带来" => "私はあなたのかばんをもってきませんでした",
          "他要把人民币换成日元" => "彼は人民元を日本円に換えたがっています",
          "这个多少钱？" => "これはいくらですか？",
          "四百七十块也个" => "一つ４７０元です",
          "我有两千块左右" => "私は２０００元ほど持っています"
        }
       
        sentence_alls = Hash[sentence_all.to_a.sample(18)] 
        
   sentence_alls.each do |key,value|
     puts "「#{value}」に対応する単語を入力してください。"

     answer = gets.chomp.to_s

    if answer == "exit"
          break
        end
        my_answer = Resout.new(key,answer)
        my_answer.ans
  end

  my_point = Points.new($correct_count,$loop_count)
  my_point.poin
  end
elsif top == 3
  puts "ようこそ15課へ！"
  puts "なにをしますか？半角数字を入力してください"
  puts "----------------------------------------------"
  puts "menu 1: 単語, 2: 文章(穴うめ), 3: 文章(全文)"
  puts "----------------------------------------------"
   b15 = gets.chomp.to_i
    case b15
     when 1
        puts "単語"
   words = { 
        }
    wordsh = Hash[words.to_a.sample(33)] 
     wordsh.each do |key,value|
      puts "「#{value}」に対応する単語を入力してください。"
      answer = gets.chomp.to_s
      if answer == "exit"
          break
        end
        my_answer = Resout.new(key,answer)
        my_answer.ans
  end
        my_point = Points.new($correct_count,$loop_count)
        my_point.poin
     when 2
        puts "単語"
   words = { 
        }
    wordsh = Hash[words.to_a.sample(33)] 
     wordsh.each do |key,value|
      puts "「#{value}」に対応する単語を入力してください。"
      answer = gets.chomp.to_s
      if answer == "exit"
          break
        end
        my_answer = Resout.new(key,answer)
        my_answer.ans
  end
        my_point = Points.new($correct_count,$loop_count)
        my_point.poin
     when 3
        puts "単語"
   words = { 
        }
    wordsh = Hash[words.to_a.sample(33)] 
     wordsh.each do |key,value|
      puts "「#{value}」に対応する単語を入力してください。"
      answer = gets.chomp.to_s
      if answer == "exit"
          break
        end
        my_answer = Resout.new(key,answer)
        my_answer.ans
  end
        my_point = Points.new($correct_count,$loop_count)
        my_point.poin
    end
elsif top == 4
  puts "ようこそ16課へ！"
  puts "なにをしますか？半角数字を入力してください"
  puts "----------------------------------------------"
  puts "menu 1: 単語, 2: 文章(穴うめ), 3: 文章(全文)"
  puts "----------------------------------------------"
  c16 = gets.chomp.to_i
  case c16
  when 1
   puts "単語"
   words = { 
          "兴趣" => "興味[xingqu]",
          "印象" => "印象[yinxiang]",
          "高兴" => "嬉しい[gaoxing]",
          "礼物" => "プレゼント[liwu]",
          "被" => "〜によって[bei]",
          "带来" => "持ってくる[dailai]",
          "差不多" => "ほとんど[chabuduo]",
          "花光" => "使い切る[huaguang]",
          "就要～了" => "もうすぐ〜になる[jiu yao~le]",
          "不要" => "〜するな[buyao]",
          "更" => "さらに[geng]",
          "陪" => "同行する、つきそう[pei]",
          "只" => "ただ、だけ[zhi]",
          "毕业" => "卒業する[biye]",
          "考试" => "試験する[kaoshi]"
        }
    wordsh = Hash[words.to_a.sample(33)] 
     wordsh.each do |key,value|
      puts "「#{value}」に対応する単語を入力してください。"
      answer = gets.chomp.to_s
      if answer == "exit"
          break
        end
        my_answer = Resout.new(key,answer)
        my_answer.ans
  end
        my_point = Points.new($correct_count,$loop_count)
        my_point.poin
  when 2
    puts "文章穴うめ"
    words = { 
     "时间过得()!(時間が過ぎるのは本当に速い！" => "真快啊",
      "我明天()回东京(私は明日にはすぐ東京に帰ります)" => "就要",
      "你对中国的印象()？(あなたの中国に対する印象はいかがですか？)" => "怎么样",
      "我以前()中国(私は前から中国が好きでした)" => "就喜欢",
      "现在对中国更有()了(今は中国に対してもっと興味を持つようになりました)" => "兴趣",
      "你有时间()我去吗？(あなたは私に付き合ってくれる時間がありますか？)" => "陪",
      "带来的钱()都被我花光了(持ってきたお金は殆ど使い切ってしましました)" => "差不多",
      "你()去王府井了(あなたは王府井に行っては行けません)" => "不要",
      "你们三月()毕业()(私達は三月にはもう卒業です)" => "就要,了",
      "后天()考试()(明後日からすぐ試験です)" => "就要,了",
      "()下雨()(もうすぐ雨が降ります)" => "要,了",
      "快下课()(もうすぐ授業が終わります)" => "了",
      "()放暑假()(もうすぐ夏休みになります)" => "快,了",
      "今天我()老师批评了(今日私は先生に叱られました)" => "被",
      "我的雨伞()我姐姐拿走了(私の傘は姉に持っていかれました)" => "被",
      "他没()老师表扬过(彼は先生に褒められたことがありません)" => "被",
      "()吃太凉的东西。对身体不好(あまりに冷たいものを食べてはいけません)" => "不要",
      "没有票，()进去(切符がない人は入ってはいけません)" => "不能"
        }
    wordsh = Hash[words.to_a.sample(33)] 


 
   wordsh.each do |key,value|
          puts "「#{key}」に対応する単語を入力してください。"
          answer = gets.chomp.to_s
     if answer == "exit"
          break
        end
        my_answer = Resout.new(value,answer)
        my_answer.ans
    end

    my_point = Points.new($correct_count,$loop_count)
    my_point.poin
  when 3
    puts "文章全文"
    words = { 
      "时间过得真快啊!" => "時間が過ぎるのは本当に速い！",
      "我明天就要回东京" => "私は明日にはすぐ東京に帰ります",
      "你对中国的印象怎么样？" => "あなたの中国に対する印象はいかがですか？",
      "我以前就喜欢中国" => "私は前から中国が好きでした",
      "现在对中国更有兴趣了" => "今は中国に対してもっと興味を持つようになりました",
      "你有时间陪我去吗？" => "あなたは私に付き合ってくれる時間がありますか？",
      "带来的钱差不多都被我花光了" => "持ってきたお金は殆ど使い切ってしましました",
      "你不要去王府井了" => "あなたは王府井に行っては行けません",
      "你们三月就要毕业了" => "私達は三月にはもう卒業です",
      "后天就要考试了" => "明後日からすぐ試験です",
      "要下雨了" => "もうすぐ雨が降ります",
      "快下课了" => "もうすぐ授業が終わります",
      "快放暑假了" => "もうすぐ夏休みになります",
      "今天我被老师批评了" => "今日私は先生に叱られました",
      "我的雨伞被我姐姐拿走了" => "私の傘は姉に持っていかれました",
      "他没被老师表扬过" => "彼は先生に褒められたことがありません",
      "不要吃太凉的东西。对身体不好" => "あまりに冷たいものを食べてはいけません",
      "没有票，不能进去" => "切符がない人は入ってはいけません"
        }
    wordsh = Hash[words.to_a.sample(33)]  
    wordsh.each do |key,value|
        puts "「#{value}」に対応する文章を入力してください。"
        answer = gets.chomp.to_s
       if answer == "exit"
          break
        end
        my_answer = Resout.new(key,answer)
        my_answer.ans
    end

    my_point = Points.new(correct_count,loop_count)
    my_point.poin
  end
else
  puts "エラー"
  break
end
end
