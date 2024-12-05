FactoryBot.define do
  factory :user do
    uuid { SecureRandom.uuid }
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password }
    reset_password_token { Faker::Lorem.word }
    reset_sent_at { Faker::Time.between(from: 1.day.ago, to: Time.now) }
    remember_created_at { Faker::Time.between(from: 1.day.ago, to: Time.now) }
    sign_in_count { 0 }
    current_sign_in_at { Faker::Time.between(from: 1.day.ago, to: Time.now) }
    last_sign_in_at { Faker::Time.between(from: 1.day.ago, to: Time.now) }
    current_sign_in_ip { Faker::Internet.ip_v4_address }
    last_sign_in_ip { Faker::Internet.ip_v4_address }
    confirmation_token { Faker::Lorem.word }
    confirmed_at { Faker::Time.between(from: 1.day.ago, to: Time.now) }
    confirmation_sent_at { Faker::Time.between(from: 1.day.ago, to: Time.now) }
    unconfirmed_email { Faker::Internet.email }
    created_by_user_id { nil }
    updated_by_user_id { nil }
  end
end
