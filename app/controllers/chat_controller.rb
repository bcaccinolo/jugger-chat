class ChatController < ApplicationController

  def index 
    if session[:login].nil?
      redirect_to :action => "login"
    end

    # render :juggernaut => {:type => :send_to_all }  do |page|
    #  page.insert_html :bottom, "user_list", "coucou"
    # end

  end

  def send_data
    unless params[:chat_input].empty?
      channel = [params[:channel]]
      message = "<div id='msg'> <b>#{session[:login]}</b>: #{params[:chat_input]}</div>"  
      render :juggernaut => {:type => :send_to_channels, :channels => channel }  do |page|
        page.replace_html "suggest", ""
        page.insert_html :bottom, "chat_data_#{channel.first}", message
        page << 'window.location.href = "#bottom"'
        page << '$("chat_input").focus()'
      end
    end
    render :nothing => true
  end

  def login
    session[:login] = params[:session_login] if request.post?
    redirect_to :action => "index" unless session[:login].nil?
  end

  def logout    
    message = "<div id='alert'>#{session[:login]} has logout</div>"
    session[:login] = nil
    render :juggernaut => {:type => :send_to_all }  do |page|
      page.insert_html :bottom, "chat_data_one", message
      page << 'window.location.href = "#bottom"'
    end
    render :update do |page|
      page << "window.location = 'chat/login'"
    end
  end

  def is_typing
    unless params[:q].empty?
    render :juggernaut => {:type => :send_to_all }  do |page|
      page.replace_html "suggest", "Someone is typing"
    end
    end
    render :nothing => true
  end

end
