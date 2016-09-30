class ReminderMailer < ApplicationMailer

  def low_stock_level(letter_generation_id)
    @letter_generation = LetterGeneration.find(letter_generation_id)
    @account = @letter_generation.account.decorate

    mail to: @letter_generation.account.mail, subject: "The letters you have requested are ready for download"
  end
end
