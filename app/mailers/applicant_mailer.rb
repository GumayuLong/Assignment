class ApplicantMailer < ApplicationMailer
  def applicant_mailer(applicant)
    @application = applicant
    @job = @application.job
    mail to: @application.application_email, subject: "Thank you for applying #{@job.title} position"
  end
end
