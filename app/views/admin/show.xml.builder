xml.instruct!
xml.dataset do
  xml.row do

      xml.id @admin.id
      xml.email @admin.email

      # SIGN COUNT
      xml.sign_in_count @admin.sign_in_count

      # CREATED
      xml.created_at @admin.created_at
      xml.updated_at @admin.updated_at

      # IP
      xml.ip @admin.current_sign_in_ip
      xml.last_ip @admin.last_sign_in_ip

      # WHEN SIGN
      xml.sign_in @admin.current_sign_in_at
      xml.last_sign_in @admin.last_sign_in_at

  end
end

