class Rstatus
  get '/themes/:username/public.css' do
    get_user_css(params[:username], :public_style)
  end

  get '/themes/:username/profile.css' do
    get_user_css(params[:username], :profile_style)
  end

  get '/themes/:username/other.css' do
    get_user_css(params[:username], :other_style)
  end

  put '/themes/:username' do
    @user = User.first :username => params[:username]
    if @user == current_user
      if @user.theme.nil?
        t = Theme.new(
          :user => @user
        )
      else
        t = @user.theme
      end
      if t.edit(params)
        flash[:notice] = "Theme saved!"
      else
        flash[:notice] = "Theme could not be saved!"
      end
    else
      redirect "/"
    end
    redirect "/users/#{params[:username]}"
  end

  def get_user_css(username, name)
    user = User.first :username => username
    content = ""
    if user
      if user.theme.nil?
        t = Theme.new(
          :user => user
        )
      else
        content = user.theme.send(name)
      end
    end
    layout = false
    content_type 'text/css', :charset => 'utf-8'
    content
  end
end
