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

   answer = gets.to_s

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

  answer = gets.to_s

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

     answer = gets.to_s

    if answer == "exit"
          break
        end
        my_answer = Resout.new(key,answer)
        my_answer.ans
  end

  my_point = Points.new($correct_count,$loop_count)
  my_point.poin
  end