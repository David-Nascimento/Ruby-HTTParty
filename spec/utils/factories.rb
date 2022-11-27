require "faker"
require_relative "../models/user_model"

FactoryBot.define do
    factory :user, class: UserModel do
        full_name { "David Halison" }
        email { "david@teste.com" }
        password { "david123" }

       after(:build) do |user|
        Database.new.delete_user(user.email)           
       end
    end

    factory :registered_user, class: UserModel do
        id { 0 }
        full_name { Faker::Movies::StarWars::character }
        email { Faker::Internet.free_email(name: full_name) }
        password { "loki123" }

        after(:build) do |user|
            Database.new.delete_user(user.email)           
            result = ApiUser.save(user.to_hash)
            user.id = result.parsed_response["id"]
        end
    end

    factory :user_wrong_email, class: UserModel do
        full_name { "David Halison" }
        email { "david#teste.com" }
        password { "david123" }
    end

    factory :empty_email, class: UserModel do
        full_name { "David Halison" }
        email { "" }
       password { "david123" }
    end

    factory :empty_full_name, class: UserModel do
        full_name { "" }
        email { "david@teste.com.br" }
       password { "david123" }
    end

    factory :empty_password, class: UserModel do
        full_name { "David Halison" }
        email { "david@teste.co.br" }
       password { "" }
    end

    factory :full_name_notNull, class: UserModel do
        email { "david@teste.co.br" }
       password { "david123" }
    end

    factory :password_notNull, class: UserModel do
        full_name { "David Halison" }
        email { "david@teste.co.br" }
    end

    factory :email_notNull, class: UserModel do
        full_name { "David Halison" }
        password { "david123" }
    end
end