set :environment, :development,:production
set :output, 'log/file.log'

every :day, :at => '1200am'do
  rake "rake auction:select_winner"
  rake "rake auction:reselect_winner"
end