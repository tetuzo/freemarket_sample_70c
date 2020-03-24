FactoryBot.define do

  factory :card do
    user_id              {"7"}
    customer_id          {"cus_ab4bb5253a3ecfd85d8651aa322f"}
    card_id              {"car_1cfa69dede851fa80a1cead2c02e"}
    created_at           {"2020-03-18 09:42:23"}
    updated_at           {"2020-03-18 09:42:23"}
  end

  factory :user do
    email                {"huri@gmail.com"}
    encrypted_password   {"$2a$11$st0sa8IfWYlR9jYIcK8t6eJoT66OApdOzlG.Rsy5qL/KBfAVsSMXW"}
    nickname             {"フリマックス"}
  end

end