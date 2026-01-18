# frozen_string_literal: true

class Acompanhante < ApplicationRecord
  
  has_one_attached :img_destaque_1 do |attachable|
    attachable.variant(:thumb, resize_to_limit: [100, 100])
    attachable.variant(:cover, resize_to_limit: [200, 200])
  end
  has_one_attached :img_destaque_2 do |attachable|
    attachable.variant(:thumb, resize_to_limit: [100, 100])
    attachable.variant(:cover, resize_to_limit: [200, 200])
  end
  has_one_attached :img_destaque_3 do |attachable|
    attachable.variant(:thumb, resize_to_limit: [100, 100])
    attachable.variant(:cover, resize_to_limit: [200, 200])
  end
  has_one_attached :img_destaque_4 do |attachable|
    attachable.variant(:thumb, resize_to_limit: [100, 100])
    attachable.variant(:cover, resize_to_limit: [200, 200])
  end
  has_one_attached :img_destaque_5 do |attachable|
    attachable.variant(:thumb, resize_to_limit: [100, 100])
    attachable.variant(:cover, resize_to_limit: [200, 200])
  end
  has_one_attached :img_destaque_6 do |attachable|
    attachable.variant(:thumb, resize_to_limit: [100, 100])
    attachable.variant(:cover, resize_to_limit: [200, 200])
  end
end
