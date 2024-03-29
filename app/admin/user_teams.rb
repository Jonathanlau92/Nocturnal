ActiveAdmin.register UserTeam do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :team_id, :captain
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :team_id, :captain]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Team Details" do
      f.input :user_id, as: :select, collection: User.all.map{|u| [u.email, u.id]}.uniq
      f.input :team_id, as: :select, collection: Team.all.map{|team| [team.name, team.id]}.uniq
      f.input :captain
    end
    f.actions
  end
  
end
