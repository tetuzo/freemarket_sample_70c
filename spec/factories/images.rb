FactoryBot.define do

  factory :image do
    image                  {File.open("#{Rails.root}/public/images/logo/logo.png")}
    item_id                {"1"}
  end

end
