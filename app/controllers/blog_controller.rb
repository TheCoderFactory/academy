class BlogController < ApplicationController
  def index
    @posts = Post.all.current_articles.paginate(:page => params[:page], :per_page => 5)
    puts "HHHHHHHH"
    @posts.each do |p|
      puts p.title
    end
    @info_sessions = InfoSessionDate.all
    @info_session_dates = Array.new
    @info_sessions.each do |session|
      @info_session_dates << session.session_date.strftime('%d %B %Y') if session.session_date.future?
    end
    @info_session_dates.sort! { |a,b|  DateTime.parse(a) <=> DateTime.parse(b) }
    @info_session_date = Array.new
    @info_session_date << @info_session_dates.first
  end
end
