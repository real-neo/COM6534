class ProjectMailer < ApplicationMailer
  default from: 'epiGenesys Team 10'

  def new_project_email(req)
    @requirement = req
    mail(subject: '[epiGenesys]Confirmation of your project',
         to: req.email, cc: 'genesys-team10@shefcompsci.org.uk')
  end
end
