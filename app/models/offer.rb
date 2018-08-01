class Offer < ApplicationRecord
    validates_presence_of :title, :description, :price
    validates :price,
    numericality: { greater_than: 0, message: "A número deve ser maior que zero." }

    def self.filter_by_archived(archived)
        unless archived.nil?
            @offers = Offer.where(archived: archived)
        end
    end
    def self.filter_by_admin(admin)
        unless admin.nil?
            @offers = Offer.all().where(created_by: admin) 
        end
    end

    # def self.filter(archived, admin, pag, limit)

    #     @offers = Offer.paginate(:page => pag, :per_page => limit)
        
    #     unless archived.nil?
    #         @offers = Offer.where(archived: true)
    #     end
    #     unless admin.nil?
    #         @offers = Offer.all().where(created_by: admin) 
    #     end
    # end
    
    def as_json(options = {})
        super(options.merge({ except: [:created_at,:updated_at] }))
    end
end
