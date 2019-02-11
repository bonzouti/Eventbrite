class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'


  def insciption_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @attendance.find.User(:user_id).email, subject: 'vous etes bien inscrit à l'event !')
  end
 
end
