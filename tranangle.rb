puts '数値を入力してください'
data = gets.to_i
puts "#"
data.times do |i,a|
  i += 1
  num = 2
  data_num = data - 2
    for num in 1..data_num do
     if i == num
       num -= 1
     puts "#"+ "=" * num   + "#"
     num += 1
     end
   end
end
puts "#"*data