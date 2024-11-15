class Application < ApplicationRecord
  belongs_to :job
  validates :job_id, uniqueness: { scope: :application_email, message: 'You have already applied for this job with this email!' }, presence: true
  validate :job_exists?

  def send_application_email
    ApplicantMailer.applicant_mailer(self).deliver_now
  end

  private
    def job_exists?
      errors.add(:job, 'must exist') unless Job.exists?(self.job_id)
    end
end
