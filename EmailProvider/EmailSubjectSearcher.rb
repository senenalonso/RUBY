require 'pry'

class EmailSubjectSearcher
  def word_searcher_in_subjects?(word, email, email_provider)
    subjects = email_provider.get_subjects("email")
    result = false
    i=0
    while ((i < subjects.length) && !result)
      result = subjects[i].include?(word) && word!=""
      i += 1
    end 
    result   
  end  
end