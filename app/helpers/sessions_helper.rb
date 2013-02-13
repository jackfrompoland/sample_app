module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user # tu musi byc 'self' poniewaz bez tego ruby utworzyloby lokalna zmienna "current_user"
  end

  def signed_in?
    !current_user.nil?
  end

  # przyklad "cookies", ktore przedawnia sie za 20 lat
  # cookies[:remember_token] = { value: user.remember_token, expires: 20.years.from_now.utc }

  def current_user=(user) # to jest definicja metody o nazwie "current_user", ktora przyrownuje cos i ma argument "user"
                          # wydaje mi sie, ze to jest takie "set"
    @current_user = user
  end

  def current_user
    # wydaje mi sie, ze to jest takie "get"
    # metoda ta zwraca "@current_user" lub 
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

end
