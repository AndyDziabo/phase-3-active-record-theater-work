class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.pluck("actor")
    end

    def locations
        self.auditions.pluck("location")
    end

    def lead
        val = self.auditions.find_by("hired = ?", true)
        return val if val
            "no actor has been hider for this role"
    end

    def understudy
        val = self.auditions.where("hired = ?", true).second
        return val if val
            "no actor has been hider for this role"
    end
end