class AddRememberTokenToUsers < ActiveRecord::Migration
  # ten plik tworzy migracje, czyli zapis zmian jakie chcemy dokonac na wybranej tablicy, tutaj 'Users'
  # potem musimy za pomoca rake wykonac te migracje:
  # bundle exec rake db:migrate
  # bundle exec rake db:test:prepare <- to nie jest wymagane przez wszystkie bazy danych ale jest dobra praktyka programistyczna

  def change
    add_column :users, :remember_token, :string
    add_index  :users, :remember_token
  end
end
