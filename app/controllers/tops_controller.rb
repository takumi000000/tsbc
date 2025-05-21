class TopsController < ApplicationController
    def index
        @subjects = Subject.includes(:courses).order(:name)
    end
    
    def courses
        list = Course.where(s_code: params[:c_code]).order(:name)
        render json: list.select(:s_code, :name)
    end

    def start_survey
        puts "#####params#######"
        puts params
        session[:info][:student_number] = params["student_number"]
        session[:info][:department] = params["department"]
        session[:info][:course] = params["course"]
        session[:info][:grade] = params["grade"]
        session[:info][:content] = params["content"]
        session[:info][:teacher] = []
        # 学科ごとに担当教員を振り分ける
        case params["department"]
        when "医療事務"
          session[:info][:teacher] = ["黒田","中井", "大森", "平野", "遠藤(学支)","キャリア演習"]
        when "医療事務"
          session[:info][:teacher] = ["黒田","中井", "大森", "平野", "遠藤(学支)","キャリア演習"]
        when "地域経済医療事務"
            session[:info][:teacher] = ["中井","黒田", "大森","平野", "遠藤(学支)","キャリア演習"]
        when "公務員"
            session[:info][:teacher] = ["石飛","高木","遠藤(学支)","キャリア演習"]
        when "動物"
            session[:info][:teacher] = ["伊藤","𠮷岡","三宅", "平野", "遠藤(学支)","キャリア演習"]
        when "IT"
            session[:info][:teacher] = ["下橋","山邊","永岡", "遠藤(学支)","キャリア演習"]
        when "IT(米子)"
            session[:info][:teacher] = ["井上","長尾","キャリア演習"]
        when "こども総合"
            session[:info][:teacher] = ["遠藤","西田","福士","髙森",
                                "黒田", "平野", "遠藤(学支)", "オルグン","キャリア演習"]
        when "国際自動車整備士"
            session[:info][:teacher] = ["難波","内田","安食", "黒田","キャリア演習"]
        when "国際観光ビジネス"
            session[:info][:teacher] = ["西村優子(にしむらゆうこ)","西村璃子(にしむらりこ)","平野","キャリア演習"]                            
        end
        redirect_to controller: 'surveys', action: 'index'
      end
    # def start_survey
    #     @@info[:student_number] = params[:student_number]
    #     @@info[:department] = params[:department]
    #     @@info[:course] = params[:course]
    #     @@info[:grade] = params[:grade]
    #     @@info[:content] =  params[:content]
    #     # 学科ごとに担当教員を振り分ける
    #     case params[:department]
    #     when "医療事務"
    #         session[:info][:teacher] = ["黒田","中井", "大森", "平野", "遠藤(学支)","キャリア演習"]
    #     when "地域経済医療事務"
    #         session[:info][:teacher] = ["中井","黒田", "大森","平野", "遠藤(学支)","キャリア演習"]
    #     when "公務員"
    #         session[:info][:teacher] = ["石飛","高木","遠藤(学支)","キャリア演習"]
    #     when "動物"
    #         session[:info][:teacher] = ["伊藤","𠮷岡","三宅", "平野", "遠藤(学支)","キャリア演習"]
    #     when "IT"
    #         session[:info][:teacher] = ["下橋","山邊","永岡", "遠藤(学支)","キャリア演習"]
    #     when "IT(米子)"
    #         session[:info][:teacher] = ["井上","長尾","キャリア演習"]
    #     when "こども総合"
    #         session[:info][:teacher] = ["遠藤","西田","福士","髙森",
    #                             "黒田", "平野", "遠藤(学支)", "オルグン","キャリア演習"]
    #     when "国際自動車整備士"
    #         session[:info][:teacher] = ["難波","内田","安食", "黒田","キャリア演習"]
    #     when "国際観光ビジネス"
    #         session[:info][:teacher] = ["西村優子(にしむらゆうこ)","西村璃子(にしむらりこ)","平野","キャリア演習"]                            
    #     end
    #     redirect_to controller: 'surveys', action: 'index'
    # end
end
