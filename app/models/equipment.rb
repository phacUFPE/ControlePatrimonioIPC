class Equipment < ApplicationRecord
    belongs_to :group 

    validates :equipment_id, :presence => true, uniqueness: { scope: :group_id, message: "Equipment id already taken"}
    validates :name, :presence => true
    validates :brand, :presence => true
    validates :model, :presence => true

    def show_description
        if self[:description] != nil
            if self[:description].gsub(/\s+/, "") == ""
                self[:description] = "No description"
            end
        end
    end

    def show_equipment_id
        if self[:equipment_id] != nil
            self[:equipment_id].to_s.rjust(6, '0')
        end
    end

    def show_group_id
        if self[:group_id] != nil
            self[:group_id].to_s.rjust(3, '0')
        end
    end

    def full_code
        self.group_id.to_s.rjust(3, '0') + '.' + self.equipment_id.to_s.rjust(6, '0')
    end

    private
        def unique_equipment_by_group
            errors.add(:equipment_id, "ERROR") if Equipment.find_by(group_id: self.grouo_id, equipment_id: self.equipment_id)
        end
end
