class SurveysController < ApplicationController
    def index
        @questions1 = Question.where(q_id: 1)
    end
    def subject_select
        subject   = Subject.find_by!(c_code: params[:id])
        @courses  = subject.courses.order(:name)
    
        respond_to do |format|
          format.turbo_stream
          format.json { render json: @courses.select(:id, :name) }
        end
    end

    def evaluation
        @questions2 = Question.where(q_id: 2)
        @teacher = session[:info]["teacher"]

        # 学科ごとに担当教員を振り分ける
        # case session[:info][:department]
        # when "医療事務"
        #     @teacher = ["黒田","中井","平野", "遠藤"]
        # when "地域経済医療事務"
        #     @teacher = ["黒田","中井","平野", "遠藤"]
        # when "公務員"
        #     @teacher = ["石飛","高木","平野", "遠藤"]
        # when "動物"
        #     @teacher = ["伊藤","吉岡","三宅", "遠藤"]
        # when "IT"
        #     @teacher = ["下橋","山邊","永岡", "遠藤"]
        # when "IT(米子)"
        #     @teacher = ["井上","長尾"]
        # when "こども総合"
        #     @teacher = ["遠藤","福士","平野"]
        # when "国際自動車整備士"
        #     @teacher = ["難波","内田","安食"]
        # when "国際観光ビジネス"
        #     @teacher = ["西村"]                            
        # end
        
    end
    def fin
        @student_number = session[:info]["student_number"]
    end
    def create
        ary = []
        ary << "School Check"
        
        Question.where(q_id: 1).size.times do |i|
            ary << params["q#{i+1}".to_sym]
        end

        ary << params[:good_points]
        ary << params[:improvement_points]

        Answer.create(
            student_number: session[:info]["student_number"], 
            department: session[:info]["department"], 
            course: session[:info]["course"], 
            grade: session[:info]["grade"], 
            content: ary)
        redirect_to controller: 'surveys', action: 'evaluation'
    end
    def create2
        ary = []
        ary << params[:teacher]

        # 選択した担当教員を削除
        session[:info]["teacher"].delete(params[:teacher])

        Question.where(q_id: 2).size.times do |i|
            ary << params["q#{i+1}".to_sym]
        end

        ary << params[:good_points]
        ary << params[:improvement_points]

        Answer.create(
            student_number: session[:info]["student_number"], 
            department: session[:info]["department"], 
            course: session[:info]["course"], 
            grade: session[:info]["grade"], 
            content: ary)
            puts Answer.last.content

        if session[:info]["teacher"].empty?
            redirect_to controller: 'surveys', action: 'fin'
        else
            redirect_to controller: 'surveys', action: 'evaluation'
        end
    end
end
