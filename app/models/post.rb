class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 
#write before after the belongs to and validates but before other methods
  before_validation :make_title_case

  before_save :email_author_about_post
  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def email_author_about_post
    # Not implemented.
    # For more information: https://guides.rubyonrails.org/action_mailer_basics.html
  end
  
  def make_title_case # in order to make sure
    # the validation passes before every save we create this method
    self.title = self.title.titlecase
  end
end
