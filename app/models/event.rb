class Event < ApplicationRecord
  TEMPLATES = {
    bath_cleaning: '風呂掃除',
    checking_post: '郵便の確認',
    cooking_papa: '朝ごはんをつくる',
    garvage_removal: 'ゴミ出し',
    ready_to_go_to_kindergarten: '保育園の準備',
    toilet_cleaning: 'トイレ掃除',
    walking_dog: '犬の散歩',
    washing_clothes: '洗濯'
  }.freeze
  has_one_attached :image
end
