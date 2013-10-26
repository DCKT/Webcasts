class Contact < ActionMailer::Base
  default from: "contact@webcasts.fr"

  def welcome(email)
    @email = email
    mail(to: @email, subject: "Bienvenue sur Webcasts !")
  end

  def annonce_contact(email, message)
    @email = email
    @message = message

    mail(to: @email, subject: "Annonce")
  end
end
