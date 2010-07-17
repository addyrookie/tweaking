every 15.minutes do
  runner "Goal.extract_news"
end

every 20.minutes do 
  runner "Spain.extract_news"
end
