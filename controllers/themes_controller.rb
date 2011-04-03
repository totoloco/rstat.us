class Rstatus
  get '/themes/:username/public.css' do
    user = User.first :username => params[:username]
    content = ""
    if user
      if user.theme.nil?
        t = Theme.new(
          :user => user
        )
      else
        content = user.theme.public_style
      end
    end
    content_type 'text/css', :charset => 'utf-8'
    content
  end

  get '/themes/:username/profile.css' do
    user = User.first :username => params[:username]
    content = ""
    if user
      if user.theme.nil?
        t = Theme.new(
          :user => user
        )
      else
        content = user.theme.profile_style
      end
    end
    layout = false
    content_type 'text/css', :charset => 'utf-8'
    content
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
      t.public_style  = params[:public_style]
      t.profile_style = params[:profile_style]
      if t.save
        flash[:notice] = "Theme saved!"
      else
        flash[:notice] = "Theme could not be saved!"
      end
    else
      redirect "/"
    end
    redirect "/users/#{params[:username]}"
  end
end
