ActiveAdmin.register Patient do
  permit_params :phone_number, :type, :name
end
