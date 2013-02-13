class UsersController < ApplicationController
  # wydaje mi sie, ze kontroler przejmuje logike biznesowa naszej aplikacji
  # tutaj zajmuje sie logika dla obiektu @user klasy User 
  # ??? nie ogarniam tu wszystkiego

  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
    # before_filter  <- ta metoda jest wywolywana przed wyszczegolnionymi akcjami
    # signed_in_user <- metoda, ktora wymaga, zeby user byl signedin
    # metoda "before_filter" bedzie uruchamiana tylko przed "edit" i "update"
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy #??? 'signed_in_user' oraz 'admin_user' maja uprawnienia do 'destroy' -> wydawalo mi sie, ze tylko admin moze miec takie uprawnienia 

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def index
    #@users = User.all tutaj byly brane wszystkie rekordy, teraz beda brane przy uzyciu metody "paginate"
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new 
    #to jest potrzebne aby test "user_pages_spec.rb" mogl za pomoca "capibary" wypelniac pola formatki stworzonej
    #za pomoca metody helpera. Metoda nazywa sie "form_for" i tworzy formatke do wpisywania danych do pol klasy User.
    #Metoda "form_for" bierze jako argument obiekty klasy User, argument ten jest dostarczany przez dzialajaca aplikacje u klienta, 
    #aby moc przeprowadzic pozytywny test musimy stworzyc ten obiekt w tym pliku. <= ??? tak do konca to tego nie ogarniam
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.

      flash[:success] = "Welcome to the Sample App!" 
      # zapisujemy do obiektu typu "flash" <- kolejny pre-definiowany obiekt, sluzy do przechowywania danych tymczasowych
      # uzywamy tu symbolu ":success"


      redirect_to @user # ??? tego nie rozumiem, jak to jest mozliwe, ze przekierowujemy na obiekt? Dlaczego przenosi nas to do strony glownej?
    else
      render 'new'
    end
  end

  def edit
    #@user = User.find(params[:id]) tego juz nie uzywamy, poniewaz zmienna @user jest zdefiniowana ciele metody "correct_user"
  end

  def update
    # @user = User.find(params[:id]) tego juz nie uzywamy, poniewaz zmienna @user jest zdefiniowana ciele metody "correct_user"
    if @user.update_attributes(params[:user])
      # Handle a successful update.
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in." 
          # we use a shortcut for setting flash[:notice] by passing an options hash to the redirect_to function. 
          # The code in Listing 9.12 is equivalent to the more verbose:
          # flash[:notice] = "Please sign in."
          # redirect_to signin_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
