class Describe < ActiveRecord::Base
  belongs_to :project

  #search

  def self.search(search)
    if search
      # find(:all, :conditions => ['title LIKE ? OR project_id LIKE ? ', "%#{search}%", "%#{search}%" ] )
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"] )
    else
      find(:all)
    end
  end

  def self.something_value(value)
  end

end
