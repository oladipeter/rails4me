xml.instruct!
xml.dataset do
  @describes.each do |describe|
    xml.row do
      xml.id describe.id
      xml.title truncate_the_text(describe.title, 30)
      xml.short_description truncate_the_text(describe.short_description, 50)
      xml.gitlink describe.gitlink
      xml.public describe.public
    end
  end
end
