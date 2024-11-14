class Application < ApplicationRecord
  belongs_to :job

  def send_application_email
    ApplicantMailer.applicant_mailer(self).deliver_now
  end
end
