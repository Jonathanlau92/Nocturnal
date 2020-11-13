ActiveAdmin.register League do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :date, :price, :moderator, :lobby_id, :lobby_password, :discord_link, :prize_pool
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :date, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
