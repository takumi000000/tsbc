class TopsController < ApplicationController
    def index
        @subjects = Subject.includes(:courses).order(:name)
    end
    
    def courses
        list = Course.where(s_code: params[:c_code]).order(:name)
        render json: list.select(:s_code, :name)
    end

    def start_survey
        session[:info][:student_number] = params["student_number"]
        session[:info][:department] = params["department"]
        session[:info][:course] = params["course"]
        session[:info][:grade] = params["grade"]
        session[:info][:content] = params["content"]
        session[:info][:teacher] = []
        # 学科ごとに担当教員を振り分ける
        case params["department"]
        when "CI"
            session[:info][:teacher] = ["平野", "中井","黒田", "杉原(キャリア演習)","石飛(ビジネススキル)"]
        when "KO"
            session[:info][:teacher] = ["高木","勝部","杉原","杉原(キャリア演習)","石飛(ビジネススキル)"]
        when "ANM"
            session[:info][:teacher] = ["伊藤","吉岡","平野", "杉原(キャリア演習)","石飛(ビジネススキル)"]
        when "IT"
            session[:info][:teacher] = ["下橋","山邊","佐藤", "杉原(キャリア演習)","石飛(ビジネススキル)"]
        when "ITY"
            session[:info][:teacher] = ["井上(いのうえ)","長尾(ながお)","川本(かわもと{日本語})","石飛(いしとび){ビジネススキル}"]
        when "CLD"
            session[:info][:teacher] = ["遠藤","西田","福士","髙森",
                                "黒田", "杉原(キャリア演習)", "オルグン","石飛(ビジネススキル)"]
        when "CAR"
            session[:info][:teacher] = ["難波","内田"]
        when "KKB"
            session[:info][:teacher] = ["川本(かわもと)","松村(まつむら)","平野(ひらのMOS)","大國(おおぐに)","神田(かんだ)"]                            
        end
        redirect_to controller: 'surveys', action: 'index'
      end
end
