# ruby-1.9.3
price = [] # 商品金額

# 商品総数とキャンペーン日数
input_line = gets.to_s.strip
input = input_line.split("\s")
price_count = input[0].to_i
campain_count = input[1].to_i

# 商品金額
price_count.times do
  price << gets.to_i
end
price.sort!.reverse!

# キャンペーン金額
campain_count.times do
  m = gets.to_i

  # キャンペーンよりも小さい金額がないかどうかをチェック
  if price.min > m
    print "0\n"
    next
  end
  
  ans = 0
  min = 1
  max = price_count - 1
  mid = 0
  
  # 二分探索
  price_count.times do |i|
	sub_price = m - price[i]
	mid = (min + max) / 2
	
	# 一致したら終了
	if price[mid] == sub_price && mid != i 
	  ans = m
	  break
	elsif price[mid] > sub_price
	  min = mid + 1
	elsif price[mid] < sub_price
      max = mid
	end
	
	sub_price = price[i] + price[mid]
    if min < max
	  if sub_price < m && sub_price > ans
	    ans = sub_price
	  end
	  redo
	end

	if sub_price < m && sub_price > ans
	  ans = sub_price
	end
	min = i + 2
	max = price_count - 1 
	
  end
  
  print "#{ans}\n"
end