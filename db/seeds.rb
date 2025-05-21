# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 質問事項の作成
puts "Creating questions..."
[
    "私は、講義(学科)の授業に意欲的に取り組んでいる",
    "私は、演習(実習)の授業に意欲的に取り組んでいる",
    "私は授業について質問や発言をしている",
    "私は、授業時間以外で学習に取り組んだ",
    "私は、授業の課題(レポート、テスト、作品等)をより良いものにしようと努力した",
    "私は、検定試験、各種資格取得、国家試験に向けた学習に意欲的に取り組んでいる",
    "私は、校内美化に心がけている",
    "私は、学校行事(またはその準備)に積極的に取り組んだ",
    "私は、ボランティア等の奉仕活動に積極的に取り組んだ",
    "私は、就職に向けて意欲的に取り組んでいる",
].each do |que|
    Question.find_or_create_by!(question: que, q_id: 1)
end

[
    "開始・終了時間は守られているか",
    "開始・終了時の挨拶は行われているか",
    "教員は充分準備をして授業をしているか",
    "教員は教材や単元を充分理解して授業をしているか",
    "質問や発言をしやすい雰囲気か",
    "質問や発言に対してきちんと対応しているか",
    "すべての学生を公平に扱っているか",
    "授業の開始時に、授業の目標が示されているか",
    "学習の手順や指示ははっきり示されているか",
    "教員の学習内容の説明は分かりやすいか",
    "教員は学習内容のまとめをしたり、まとめをさせたりしているか",
    "学習内容が分かるよう、できるように工夫されているか",
    "声量は適切で聴き取りやすいか",
    "話すスピードは適切で聴き取りやすいか",
    "授業内容が将来の仕事や検定試験や公務員試験の役に立つと思うか"
].each do |que|
    Question.find_or_create_by!(question: que, q_id: 2)
end

# 学科・コースの作成
puts "Creating subjects and courses..."
ci = Subject.create!(name: "地域経済医療事務学科", c_code: "CI")
ci.courses.create!(name: "地域経済コース", s_code: "CI")
ci.courses.create!(name: "医療事務コース", s_code: "CI")

ko = Subject.create!(name: "公務員学科", c_code: "KO")
ko.courses.create!(name: "公務員1年コース", s_code: "KO")
ko.courses.create!(name: "公務員2年コース", s_code: "KO")

anm = Subject.create!(name: "動物学科", c_code: "ANM")
anm.courses.create!(name: "メディカルトリマーコース", s_code: "ANM")

it = Subject.create!(name: "IT学科", c_code: "IT")
it.courses.create!(name: "Rubyエンジニアコース", s_code: "IT")
it.courses.create!(name: "モバイルエンジニアコース", s_code: "IT")

it2 = Subject.create!(name: "IT学科(米子)", c_code: "ITY")
it2.courses.create!(name: "Rubyエンジニアコース", s_code: "ITY")
it2.courses.create!(name: "モバイルエンジニアコース", s_code: "ITY")

cld = Subject.create!(name: "こども総合学科", c_code: "CLD")
cld.courses.create!(name: "こども総合コース", s_code: "CLD")

car = Subject.create!(name: "国際自動車整備士学科", c_code: "CAR")
car.courses.create!(name: "2級自動車整備士コース", s_code: "CAR")

kkb = Subject.create!(name: "国際観光ビジネス学科", c_code: "KKB")
kkb.courses.create!(name: "ビジネス観光コース", s_code: "KKB")

puts "Seeding completed!"
