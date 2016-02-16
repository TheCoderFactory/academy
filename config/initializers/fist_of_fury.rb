# Ensure the jobs run only in a web server.
if defined?(Rails::Server)
  FistOfFury.attack! do
    UpdateSpreadsheetJob.recurs {daily.hour_of_day(9, 17)}
  end
end
