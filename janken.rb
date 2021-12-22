class Game
    def initialize
        @rps_result = ""
    end
    
    puts "じゃんけん..."
    def janken
        puts "0(ぐー) 1(ちょき) 2(ぱー) 3(戦わない)"
        options = ["ぐー", "ちょき", "ぱー", "戦わない"]

        #ユーザー
        user_input = gets.to_i
        if !(user_input == 0 || user_input == 1 || user_input == 2 || user_input == 3)
            puts "※【0, 1, 2, 3】のどれかを入力してね！"
            start
        end
        #コンピューター
        computer_input = rand(0..2)

        drop = user_input == 3
        draw = user_input == computer_input
        win = (user_input == 0 && computer_input == 1) || (user_input == 1 && computer_input == 2) || (user_input == 2 && computer_input == 0)

        if drop
            puts "また遊んでね！"
            exit
        elsif draw 
            puts "*--------------------------*"
            puts "あなた：#{options[user_input]} を出しました！"
            puts "相手  ：#{options[computer_input]} を出しました！"  
            puts "*--------------------------*"
            puts "あいこで..."
            start
        elsif  win
            puts "*--------------------------*"
            puts "あなた：#{options[user_input]} を出しました！"
            puts "相手  ：#{options[computer_input]} を出しました！"  
            puts "*--------------------------*"
            @rps_result = "win"
        else 
            puts "*--------------------------*"
            puts "あなた：#{options[user_input]} を出しました！"
            puts "相手  ：#{options[computer_input]} を出しました！"  
            puts "*--------------------------*"
            @rps_result = "lose"
        end

    end #end janken

    def hoi      
        puts "あっちむいて..."
        puts "0(上)　1(下)　2(右)　3(左)"
        directions = ["上", "下", "右", "左"]

        user_choice = gets.to_i
        if !(user_choice == 0 || user_choice == 1 || user_choice == 2 || user_choice == 3)
            puts "※【0, 1, 2, 3】のどれかを入力してね！"
            hoi
        end

        computer_choice = rand(4)

        puts "*--------------------------*"
        puts "あなた：#{directions[user_choice]} を出しました！"
        puts "相手  ：#{directions[computer_choice]} を出しました！"
        puts "*--------------------------*"
        
        # じゃんけんでuserが勝った場合
        if @rps_result == "win"
            if user_choice == computer_choice
                puts "やった！勝ちました！"
                start
            else
                puts "残念！負けました！"
                start
            end
        else #じゃんけんでuserが負けた場合
            if user_choice == computer_choice
                puts "残念！負けました！"
                start
            else
                puts "やった！勝ちました！"
                start
            end
        end 
    end #end hoi

end #end Game

def start
    game = Game.new
    game.janken
    game.hoi  
end
start


