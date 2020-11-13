ActiveAdmin.register User do
  permit_params :email, :password, :username, :provider, :status, :superadmin, :country, :age, :position, :steam_id

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :username
    column :provider
    column :uid
    column :steam_authentication_data
    column :stripe_customer_id
    column :status
    column :superadmin
    column :profile_picture
    column :cover_photo
    column :country
    column :age
    column :position
    column :steam_id
    actions
  end

  filter :email
  filter :created_at
  filter :username
  filter :superadmin
  filter :country
  filter :position

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :username
      f.input :status
      f.input :superadmin
      f.input :country, as: :string
      f.input :age
      f.input :position
      f.input :steam_id
    end
    f.actions
  end

end
