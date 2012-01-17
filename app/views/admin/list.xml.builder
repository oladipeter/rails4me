xml.instruct!
xml.dataset do
  xml.row do
      @admins.each do |admin|
        xml.id admin.id
        xml.email admin.email
        xml.sign_in_count admin.sign_in_count
        xml.created_at admin.created_at
        xml.updated_at admin.updated_at
        xml.ip admin.current_sign_in_ip
      end
  end
end
