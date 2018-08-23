class UserMailer < ApplicationMailer
    def user_email
        @user = params[:detalle];
        mail(to: 'rmartinezalf@gmail.com',subject: 'welcome ')
    end
end
