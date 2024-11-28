FactoryBot.define do
  factory :user do
    uuid { "" }
    email { "MyString" }
    encrypted_password { "MyString" }
    reset_password_token { "MyString" }
    reset_sent_at { "2024-11-28 10:33:23" }
    remember_created_at { "2024-11-28 10:33:23" }
    sign_in_count { 1 }
    current_sign_in_at { "2024-11-28 10:33:23" }
    last_sign_in_at { "2024-11-28 10:33:23" }
    current_sign_in_ip { "MyString" }
    last_sign_in_ip { "MyString" }
    confirmation_token { "MyString" }
    confirmed_at { "2024-11-28 10:33:23" }
    confirmation_sent_at { "2024-11-28 10:33:23" }
    unconfirmed_email { "MyString" }
    created_by_user_id { "" }
    updated_by_user_id { "" }
  end
end
