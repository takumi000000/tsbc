# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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