xml.instruct!
xml.dataset do
  @describes.each do |describe|
    xml.row do
      xml.id describe.id
      xml.title truncate_the_text(describe.title, 30)
      xml.short_description truncate_the_text(describe.short_description, 100)
      xml.gitlink capitalized_the_text(describe.gitlink)
    end
  end
end
