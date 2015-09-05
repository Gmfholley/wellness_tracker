module ActivitiesHelper
  # pluralizes cheers into a sentence in English
  I18n.backend.store_translations :en, cheer: {
    one: '1 Cheer',
    other: '%{count} Cheers'
  }
    # pluralizes comments into a sentence in English
  I18n.backend.store_translations :en, comment: {
    one: '1 Comment',
    other: '%{count} Comments'
  }
  
  # returns a sentence saying the user of this cheer cheered this
  #
  # cheer - Cheer object
  #
  # returns a String
  def user_cheered_this_sentence(cheer)
    "#{cheer.user.first_name} #{cheer.user.last_name} cheered this"
  end
  
  # returns a sentence of the first user and the number of others who cheered this
  #
  # cheers - Array of Cheer objects
  #
  # returns a String
  def user_and_others_cheered_this(cheers)
    "#{cheers.first.user.first_name} #{cheers.first.user.last_name} and #{cheers.size - 1} cheered this"
  end  
  
  # returns a sentence about the cheers in English
  #
  # cheers - Array of Cheer Objects
  #
  # returns a String
  def cheer_sentence(cheers)
    case cheers.size
    when 0
      I18n.translate :cheer, count: 0
    when 1
      user_cheered_this_sentence(cheers.first)
    else
      user_and_others_cheered_this(cheers)
    end
  end
  
end
