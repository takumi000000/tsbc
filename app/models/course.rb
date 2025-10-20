class Course < ApplicationRecord
    belongs_to :subject,
    foreign_key: :s_code,  # 自分の列
    primary_key: :c_code,  # 相手の列
    inverse_of:  :courses

    validates :name,   presence: true
    validates :s_code, presence: true
end
