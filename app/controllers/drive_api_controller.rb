class DriveApiController < ApplicationController
  require "google/api_client"
  require "google_drive"

  def index
    # Creates a session. This will prompt the credential via command line for the
    # first time and save it to config.json file for later usages.
    session = GoogleDrive.saved_session("config.json")

    # First worksheet of
    # https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
    # Or https://docs.google.com/a/someone.com/spreadsheets/d/pz7XtlQC-PYx-jrVMJErTcg/edit?usp=drive_web
    ws = session.spreadsheet_by_key("1QQoco0cOfXn3tazH6V9u8Dj84RbuYg-mhZOpLIKrDzQ").worksheets[0]

    # Gets content of A2 cell.
    puts "HHHHHHHHHHHHHHHHHHH"
    puts ws[2, 1]  #==> "hoge"
    puts "HHHHHHHHHHHHHHHHHHH"

    # Changes content of cells.
    # Changes are not sent to the server until you call ws.save().
    ws[66, 1] = "test2"
    ws.save

    # Dumps all cells.
    # (1..ws.num_rows).each do |row|
      # (1..ws.num_cols).each do |col|
        # p ws[row, col]
      # end
    # end

    # Yet another way to do so.
    # p ws.rows  #==> [["fuga", ""], ["foo", "bar]]

    # Reloads the worksheet to get changes by other clients.
    # ws.reload
  end
end
