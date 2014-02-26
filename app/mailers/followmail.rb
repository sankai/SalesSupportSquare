class Followmail < ActionMailer::Base
  default from: "kubo_kazuko@ogis-ri.co.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.followmail.send_follow_mail.subject
  #
  def send_follow_mail(shain, template, month)

    @destination  = shain.name
    @month        = month
        
    @mail_banner  = template.banner
    @mail_content = template.content
    @mail_trailer = template.trailer

    @link_url = 'http://' + ENV['COMPUTERNAME'] + ':3000/uriys/by_shain/' + month.to_s + '/' + shain.id.to_s	

    mail to: shain.email, subject: template.title

  end
end
