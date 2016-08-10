# encoding: utf-8


words = { "办出国手续" => "出国手続きをする[ban　chuguo shouxu]", 
          "托运行李" => "荷物を託送する[tuoyun xingli]", 
          "安全检查" => "安全検査[anquan jiancha]", 
          "去免税店" => "免税店に行く[qu mianshuidian]", 
          "上飞机" => "飛行機に乗る[shang feiji]", 
          "等飞机" => "飛行機を待つ[deng feiji]", 
          "买礼物" => "プレゼントを買う[mai liwu]", 
          "购物中心" => "ショッピングセンター[gouwu zhonhxin]", 
          "电影院" => "映画館[dianyingyuan]",
          "饭馆儿" => "飲食店[fanguanr]", 
          "车站" => "駅[chezhan]", 
          "医院" => "病院[yiyuan]", 
          "银行" => "銀行[yinhang]",
          "茶艺馆" => "茶芸館[chayiguan]", 
          "邮局" => "郵便局[youju]", 
          "叫出租汽车" => "タクシーを呼ぶ[jiao chuzu qiche]", 
          "护照" => "旅券[huzhao]",
          "办住房手续" => "チェックインをする[ban zhufang shouxu]", 
          "退房" => "チェックアウトをする[tui fang]", 
          "存行李" => "荷物を預ける[cun xingli]",
          "前台" => "フロント[qiantai]",
          "大厅" => "ホール[dating]", 
          "签字" => "署名をする[qianzi]",
          "房间卡" => "部屋カードfangjianka", 
          "服务员" => "従業員[fuwuyuan]", 
          "看京剧" => "京劇を見る[kan jingju]", 
          "购物" => "買い物をする[gouwu]",
          "打麻将" => "マージャンをする[da majiang]", 
          "看球赛" => "球技の試合を見る[kan qiusai]", 
          "唱卡拉ok" => "カラオケでうたう[chang kalaOK]", 
          "看电影" => "映画を見る[kan dianying]",
          "去网吧" => "ネットカフェに行く[qu wangba]", 
          "看漫画" => "漫画を読む[kan manhua]"       
        }
       
        wordsh = Hash[words.to_a.sample(33)] # いったんarrayにしてsampleした後、hashに戻す  
 

$loop_count = 0

$correct_count = 0
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

puts "\e[32m あなたは#{icorrect($correct_count,loop_count)}こ間違えちゃったのです>_^\n"
puts "あなたの正解率は#{percentage($correct_count,loop_count)}パーセントなのです>_^/"


