ActiveAdmin.register Doctor do
  permit_params :phone_number, :password, :password_confirmation, :type, :name, :category_id
  form do |f|
    f.inputs do
      f.input :phone_number
      f.input :password
      f.input :category
      f.input :name
      f.input :password_confirmation
    end
    f.actions
  end
end
