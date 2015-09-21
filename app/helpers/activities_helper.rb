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
  
  # returns a sentence saying the user of this comment commented this
  #
  # comment - Cheer object
  #
  # returns a String
  def user_commented_this_sentence(comment)
    "#{comment.user.first_name} #{comment.user.last_name} commented on this"
  end
  
  # returns a sentence of the first user and the number of others who commented this
  #
  # comments - Array of Cheer objects
  #
  # returns a String
  def user_and_others_commented_this(comments)
    "#{comment.first.user.first_name} #{comment.first.user.last_name} and #{comments.size - 1} commented on this"
  end  
  
  # returns a sentence about the comments in English
  #
  # comments - Array of Cheer Objects
  #
  # returns a String
  def comment_sentence(comments)
    case comments.size
    when 0
      I18n.translate :comment, count: 0
    when 1
      user_commented_this_sentence(comments.first)
    else
      user_and_others_commented_this(comments)
    end
  end
  
  # returns the svg file to be used to represent this exercise
  #
  # exercise - Exercise Object
  #
  # returns a string of the filename
  def exercise_svg(exercise)
    exercise_svg_hash(exercise) || "noun_exercise.svg" 
  end
  
  
  private
  def exercise_svg_hash
    {"running" => "noun_running.svg", "walking" => "noun_walking.svg" "yoga" => "noun_yoga.svg", "swimming" => "noun_swimming.svg", "softball" => "noun_baseball.svg", "baseball" => "nouN_baseball.svg", "basketball" => "noun_basketball.svg", "tennis" => "noun_tennis.svg", "weight lifting" => "noun_dumbbell.svg", "hiking" => "noun_walking.svg" }
  end
  
end
