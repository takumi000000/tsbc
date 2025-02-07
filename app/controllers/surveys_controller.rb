class SurveysController < ApplicationController
    def index
        @questions1 = Question.where(q_id: 1)
    end
    def evaluation
        @questions2 = Question.where(q_id: 2)
        
        # 科目ごとに担当教員を振り分ける
        case @@info[:department]
        when "医療事務"
            @teacher = ["下橋","山邊","平野"]
        when "地域経済医療事務"
            @teacher = ["下橋","山邊","平野"]
        when "公務員"
            @teacher = ["下橋","山邊","平野"]
        when "動物"
            @teacher = ["下橋","山邊","平野"]
        when "IT"
            @teacher = ["下橋","山邊","永岡", "遠藤"]
        when "IT(米子)"
            @teacher = ["井上","長尾"]
        when "こども総合"
            @teacher = ["下橋","山邊","平野"]
        when "国際自動車整備士"
            @teacher = ["下橋","山邊","平野"]
        when "国際観光ビジネス"
            @teacher = ["下橋","山邊","平野"]                            
        end
        
    end
    def fin
        @student_number = @@info[:student_number]
    end
    def create
        ary = []
        Question.where(q_id: 1).size.times do |i|
            ary << params["q#{i+1}".to_sym]
        end
        ary << params[:good_points]
        ary << params[:improvement_points]
        Answer.create(
            student_number: @@info[:student_number], 
            department: @@info[:department], 
            course: @@info[:course], 
            grade: @@info[:grade], 
            content: ary)
        redirect_to controller: 'surveys', action: 'evaluation'
    end
    def create2
        ary = []
        ary << params[:teacher]
        Question.where(q_id: 1).size.times do |i|
            ary << params["q#{i+1}".to_sym]
        end
        ary << params[:good_points]
        ary << params[:improvement_points]
        puts "##############create2###############"
        puts ary
        Answer.create(
            student_number: @@info[:student_number], 
            department: @@info[:department], 
            course: @@info[:course], 
            grade: @@info[:grade], 
            content: ary)
        redirect_to controller: 'surveys', action: 'evaluation'
    end
end
