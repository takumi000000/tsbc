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
        redirect_to controller: 'surveys', action: 'index'
    end
end
