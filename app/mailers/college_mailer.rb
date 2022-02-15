class CollegeMailer < ApplicationMailer
    def notify_college_creation(college_id)
        @college = College.find(college_id)
        mail(to: 'satyanarayana22121999@gmail.com', subject: 'College #{@college.name} has been created!')
        end
end
