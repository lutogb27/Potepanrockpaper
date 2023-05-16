  puts"------------------------------"
  puts"あっち向いてホイゲームを始めます。"
  
def janken
  puts "じゃんけん・・・" 
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  select_number = gets.to_i
  if !(select_number == 0 || select_number == 1 || select_number ==2)
     select_number = 3
  end
  random_number = rand(3)
  jankens = ["グー","チョキ","パー","戦わない"]
   puts "あなた：#{jankens[select_number]}を出しました"
   puts "相手：#{jankens[random_number]}を出しました"
   puts"------------------------------"

  if select_number ==3 || random_number == 3
    puts"じゃんけんが放棄されました。ゲームを終了します。"
    exit
  end
  
  number = select_number - random_number
  if number == 0
    puts "あいこで..."
    return true
  elsif number == -1 || number == 2
    @janken_result = "win"
    puts"あなたの勝ち"
    puts"あっちむいて・・・"
    return acchimuite_hoi
  elsif number == 1 || number == -2
    @janken_result = "lose"
    puts"あなたの負け"
    puts"あっちむいて・・・"
    return acchimuite_hoi
  end  
end

def acchimuite_hoi
  puts "0(上)1(下)2(左)3(右)"
  select_number2 = gets.to_i
  random_number2 =rand(3)
  directions = ["上","下","左","右"]
  puts"ホイ！"
  puts "あなた：#{directions[select_number2]} 相手：#{directions[random_number2]}"
  puts"------------------------------"
    #勝つ時
  if (@janken_result == "win" && select_number2 == random_number2) 
    puts "あなたの勝ち"
    exit
   #負けの時
  elsif (@janken_result == "lose" && select_number2 == random_number2) 
    puts "相手の勝ち"
    exit
    #あいこの時
  else (select_number2 != random_number2) || (@janken_result == "win" && select_number2 != random_number2) ||  (@janken_result == "lose"  && select_number2 != random_number2) 
    puts "もう一度ジャンケン"
    return janken
  end 
end

#ゲームを連結させて、ループに回す方法
def game
  if janken == true #last_gameが（true）成立するなら
    return true
    
  elsif acchimuite_hoi == true #last_gameが（true）成立するなら
    return false
  else
    return false
  end

end
next_game = true
while next_game do
    next_game = game
end