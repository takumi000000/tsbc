class TopsController < ApplicationController
    def index
        @courses = ["医療事務","地域経済医療事務","公務員", "動物", "IT", "IT(米子)", "こども総合", "国際自動車整備士", "国際観光ビジネス"]
        @courses2 = ["地域経済コース", "医療事務コース", 
                    "短期  公務員コース", "公務員2年生コース", 
                    "メディカルトリマーコース",
                    "Rubyエンジニアコース", "モバイルエンジニアコース",
                    "こども総合コース", 
                    "2級自動車整備士コース", 
                    "ビジネス観光コース"]
    end
    def start_survey
        @@info[:student_number] = params[:student_number]
        @@info[:department] = params[:department]
        @@info[:course] = params[:course]
        @@info[:grade] = params[:grade]
        @@info[:content] =  params[:content]
        # 学科ごとに担当教員を振り分ける
        case params[:department]
        when "医療事務"
            @@info[:teacher] = ["黒田","中井", "大森", "平野", "遠藤(学支)","キャリア演習"]
        when "地域経済医療事務"
            @@info[:teacher] = ["中井","黒田", "大森","平野", "遠藤(学支)","キャリア演習"]
        when "公務員"
            @@info[:teacher] = ["石飛","高木","遠藤(学支)","キャリア演習"]
        when "動物"
            @@info[:teacher] = ["伊藤","𠮷岡","三宅", "平野", "遠藤(学支)","キャリア演習"]
        when "IT"
            @@info[:teacher] = ["下橋","山邊","永岡", "遠藤(学支)","キャリア演習"]
        when "IT(米子)"
            @@info[:teacher] = ["井上","長尾","キャリア演習"]
        when "こども総合"
            @@info[:teacher] = ["遠藤","西田","福士","髙森",
                                "黒田", "平野", "遠藤(学支)", "オルグン","キャリア演習"]
        when "国際自動車整備士"
            @@info[:teacher] = ["難波","内田","安食", "黒田","キャリア演習"]
        when "国際観光ビジネス"
            @@info[:teacher] = ["西村優子(にしむらゆうこ)","西村璃子(にしむらりこ)","平野","キャリア演習"]                            
        end
        redirect_to controller: 'surveys', action: 'index'
    end
end
