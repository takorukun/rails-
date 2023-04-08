class Post < ApplicationRecord
    validates :title,length:{in:1..20}
    validates :startDate,presence:true
    validates :endDate,presence:true
    validates :memo,length:{maximum:500}
    validate :start_end_check

    def start_end_check
        unless self.startDate.nil? || self.endDate.nil?
            errors.add(:endDate,"の日付を正しく入力してください。") if  self.startDate > self.endDate
        end
    end
end
