ActiveAdmin.register Booking do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :room_id, :guest_details, :checkin_time, :checkout_time
  #
  # or
  #
  # permit_params do
  #   permitted = [:room_id, :guest_details, :checkin_time, :checkout_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
# =========================
# app/admin/booking.rb
# app/admin/booking.rb
# app/admin/booking.rb
# app/admin/booking.rb
ActiveAdmin.register Booking do
  permit_params :room_id, :checkin_time, :checkout_time, :guest_details

  form do |f|
    f.inputs 'Booking Details' do
      f.input :room
      f.input :checkin_time
      f.input :checkout_time
    end
    f.inputs 'Guest Details in text' do
      f.input :guest_details, as: :text, input_html: { rows: 5 } # Use text_area for JSON input
    end
    
    f.actions
  end
end

