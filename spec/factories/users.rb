FactoryGirl.define do
  factory :user do
    username 'goku'
    password_digest '$2a$10$h8ykX14ZJOynZgljAvGeLu0TsKmI0Plr96YDYdOhuabf8HTxItJTe'
    session_token 'dragonball'
  end
end
#password password
