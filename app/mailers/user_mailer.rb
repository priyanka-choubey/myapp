class UserMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to Myapp')
    end

    def tagged_email(user, article, current_user)
        @user = user
        @article = article
        @current = current_user
        mail(to: @user.email, subject: 'You were tagged by '+current_user.username)
    end

end
