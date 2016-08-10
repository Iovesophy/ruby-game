# encoding: utf-8


words = { 
"integer" => "整数",
"relative" => "相対",
"assume" => "引き受けます",
"element" => "要素",
"index" => "索引",
"indicate" => "示す",
"literal" => "まぎれもない",
"constructor" => "建設者",
"below" => "下の方に",
"indexing" => "割り出し",
"explicitly" => "はっきりと、明白に",
"initial" => "初めの、最初の",
"argument" => "議論、理由、引数",
"populate" => "配置する",
"reference" => "参考",
"note" => "文章",
"recommend" => "推奨する",
"instantiate" => "インスタンス",
"natively" => "元々の",
"instead" => "その代わりとして",
"mutable" => "変わりやすい",
"dimentional" => "寸法上の、立体的な", 
"provide" => "供給する、与える"


        }
       
        wordsh = Hash[words.to_a.sample(33)] # いったんarrayにしてsampleした後、hashに戻す  
 

loop_count = 0

correct_count = 0
puts "rubyEnglishゲームスタート！exitで中断。"

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


