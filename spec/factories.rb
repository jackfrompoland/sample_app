FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    #linia ponizej jest dla mnie zagadka, wydaje mi sie, ze tworzymy tutaj nowy obiekt. Tylko, ze bylby to obiekt bez 
    #wypelnionych pol???
    #jak to dziala???

    factory :admin do 
        admin true
    end
  end
end
