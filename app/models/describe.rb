class Describe < ActiveRecord::Base
  belongs_to :project

  #search

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ? OR keywords LIKE ? ', "%#{search}%", "%#{search}%" ] )
    else
      find(:all)
    end
  end

end
