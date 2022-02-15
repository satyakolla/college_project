class College < ApplicationRecord



    #validates :name , presence: true
    validates:name,exclusion: {in:['karthik','sai'], message: 'This name cannot be added'}
    #validates:name,inclusion: {in:['satya','naveen'], message: 'This name cannot be added'}
    validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :name, uniqueness: true
    has_one_attached :main_image
    validate :name_and_area
    validates :name, presence: true, if: :check_area_presence?

    after_initialize do
        puts "\n calling after intialize callback \n"
     end
        ## or ##
        # after_initialize :method_after_init
        # after_find :method_after_find
        # after_find :method_after_find, if: :check_the_condition?
        # after_touch :method_after_touch
        # before_save :method_before_save
        # after_save :method_after_save
        # around_save :method_around_save
        # after_destroy :method_after_destroy
        # after_commit :method_after_commit, on: [:create]
        # after_rollback :method_after_rollback


private
    def name_and_area
        if name.blank? && area.blank?
        errors.add(:base, "name and area cant be blank ")
        end
        end
        def check_area_presence?
            area == "hyderabad"
            end

            def check_the_condition?
                true
                end
                def method_after_touch
                puts "\n calling after touch callback \n"
                end
                def method_before_save
                puts "\n calling before save callback"
                end
                def method_after_save
                puts "\n calling after save callback \n"
                end
                def method_around_save
                puts "\n calling before save callback \n"
                yield
                puts "\n calling after save callback \n"
                end
                def method_after_destroy
                puts "\n calling after delete callback \n"
                end
                def method_after_init
                puts "\n calling after intialize callback1 \n"
                end
                def method_after_find
                puts "\n calling after find callback\n"
                end
                def method_after_commit
                puts "\n calling after commit callback \n"
                end
                def method_after_rollback
                puts "\n calling after rollback callback \n"
                end
end
