class UsersController < ApplicationController
  # wydaje mi sie, ze kontroler przejmuje logike biznesowa naszej aplikacji
  # tutaj zajmuje sie logika dla obiektu @user klasy User 
  # ??? nie ogarniam tu wszystkiego

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
end
