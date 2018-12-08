class ProjectMailer < ApplicationMailer
  default from: 'team10-genesys-project@shefcompsci.org.uk',
          return_path: 'system@example.com'

  def new_project_email(req)
    @requirement = req
    email_with_name = %("epiGenesys Team 10" <#{req.email}>)
    mail(subject: '[epiGenesys]Confirmation of your project',
         to: email_with_name, cc: 'genesys-team10@shefcompsci.org.uk')
  end
end
