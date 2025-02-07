class SurveysController < ApplicationController
    def index
        @questions1 = Question.where(q_id: 1)
        @questions2 = Question.where(q_id: 2)
        puts "###SurveysController#index"
        puts @@info
    end
    def create
        puts "###SurveysController#create"
        puts params
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
    end
end
