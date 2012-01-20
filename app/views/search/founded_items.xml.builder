xml.instruct!
xml.dataset do
  @describes.each do |describe|
    xml.row do
      xml.title describe.title
      xml.short_description describe.short_description
    end
  end
end
