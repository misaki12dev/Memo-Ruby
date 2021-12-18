require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_s
input_type = memo_type.chomp

if input_type == "1"
    puts "拡張子を除いたファイルを入力してください"

    file = gets.to_s
    file_name = file.chomp

    puts "メモしたい内容を入力してください"
    puts "完了したら、ctrl + D をおしてください"

    input_message = $stdin.readlines

    #ファイル生成・出力
    CSV.open("#{file_name}.csv", "w") do |csv|
        csv << ["#{input_message}"]
    end
    
    #2を選んだ場合
elsif input_type == "2"
    puts "編集したいファイル名を拡張子を除いて入力してください"

    #ファイルが存在する場合、編集処理を実行
    editFile_name = gets.chomp
    if File.exist?("#{editFile_name}.csv")
    # p CSV.read("#{editFile_name}.csv") 
    puts "メモしたい内容を入力してください"
    puts "完了したら、ctrl + D をおしてください"
    
    add_text = $stdin.readlines

       file_addEdit = File.open("#{editFile_name}.csv", "a")
       file_addEdit.puts add_text
       puts "ファイルを編集しました"
    elsif
        puts "該当ファイルが見つかりません"
    end

end