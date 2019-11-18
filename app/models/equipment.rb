class Equipment < ApplicationRecord
    belongs_to :group

    validates :equipment_id, :presence => true
    validates :name, :presence => true
    validates :brand, :presence => true
    validates :model, :presence => true

    def description
        if self[:description] != nil
            if self[:description].gsub(/\s+/, "") == ""
                self[:description] = "No description"
            end
        end
    end

    def equipment_id
        if self[:equipment_id] != nil
            self[:equipment_id].to_s.rjust(6, '0')
        end
    end

    def group_id
        if self[:group_id] != nil
            self[:group_id].to_s.rjust(3, '0')
        end
    end

    def full_code
        self.group_id.to_s.rjust(3, '0') + '.' + self.equipment_id.to_s.rjust(6, '0')
    end
end
