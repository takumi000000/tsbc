class Subject < ApplicationRecord
    has_many :courses,
    foreign_key: :s_code,
    primary_key: :c_code,
    inverse_of:  :subject,
    dependent:   :restrict_with_exception

    validates :name,   presence: true
    validates :c_code, presence: true, uniqueness: true
end
