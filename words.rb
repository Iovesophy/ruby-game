# encoding: utf-8


words = { "办出国手续" => "出国手続きをする", 
          "托运行李" => "荷物を託送する", 
          "安全检查" => "安全検査", 
          "去免税店" => "免税店に行く", 
          "上飞机" => "飛行機に乗る", 
          "等飞机" => "飛行機を待つ", 
          "买礼物" => "プレゼントを買う", 
          "购物中心" => "ショッピングセンター", 
          "电影院" => "映画館",
          "饭馆儿" => "飲食店", 
          "车站" => "駅", 
          "医院" => "病院", 
          "银行" => "銀行",
          "茶艺馆" => "茶芸館", 
          "邮局" => "郵便局", 
          "叫出租汽车" => "タクシーを呼ぶ", 
          "护照" => "旅券",
          "办住房手续" => "チェックインをする", 
          "退房" => "チェックアウトをする", 
          "存行李" => "荷物を預ける",
          "前台" => "フロント",
          "大厅" => "ホール", 
          "签字" => "署名をする",
          "房间卡" => "部屋カード", 
          "服务员" => "従業員", 
          "看京剧" => "京劇を見る", 
          "购物" => "買い物をする",
          "打麻将" => "マージャンをする", 
          "看球赛" => "球技の試合を見る", 
          "唱卡拉ok" => "カラオケでうたう", 
          "看电影" => "映画を見る",
          "去网吧" => "ネットカフェに行く", 
          "看漫画" => "漫画を読む"       
        }
       
        wordsh = Hash[words.to_a.sample(33)] # いったんarrayにしてsampleした後、hashに戻す  
 

loop_count = 0

correct_count = 0
puts "中国語ゲームスタート！exitで中断。"

wordsh.each do |key,value|
  puts "「#{value}に対応する単語を入力してください。"

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


