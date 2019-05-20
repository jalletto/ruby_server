def get_view(view_path)
  view = '' 
    File.open("./views/#{view_path}", "r") do |f|
      f.each_line do |line|
        view += line
      end
    end
  view
end 
