class Group < ApplicationRecord
    has_many :equipment, dependent: :destroy

    validates :id, :presence => true
    validates :name, :presence => true

    def show_description
        if self[:description] != nil
            if self[:description].gsub(/\s+/, "") == ""
                self[:description] = "No description"
            end
        end
    end

    def show_id
        if self[:id] != nil
            self[:id].to_s.rjust(3, '0')
        end
    end
end
