FactoryBot.define do
  factory :store do
    store_name             { '子猫' }
    category_id           { 2 }
    store_environment     { '子供用の椅子があります' }
    recommendation           { 'ランチについてくるシフォンケーキが美味しいです。' }
    association :user

    after(:build) do |store|
      store.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
