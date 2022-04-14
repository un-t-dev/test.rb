require "csv"
puts "1(新規でメモを作成する) 2(既存のメモを編集する)"
file_name = gets.chomp

if file_name == "1"
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp
  p 'メモを記入してください'
  p '完了したらCtrl + D を押してください'
  CSV.open("#{file_name}.csv",'w') do |memo|
    content = readlines
    memo << content
  end
  
  elsif file_name == "2"
    puts "編集したいファイル名入力してください"
    file_name = gets.chomp
    CSV.open("#{file_name}.csv",'w') do |csv|
      csv << ["2"]
      csv << ["#{file_name}"]
    end
    
    str = file_name
    puts "編集内容を記入してください"
    puts "完了後、Ctrl + Dを押してください"
    memo_type = $stdin.read
    CSV.open("#{str}.csv","a") do |csv|
      csv << ["#{file_name}"]
    end
    
  else
    puts "エラー"
  end