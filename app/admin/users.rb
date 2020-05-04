ActiveAdmin.register User do
  # Customize index
  index do
    selectable_column
    column :pseudo
    column :email
    column t('user.language') do |user|
      if user.language_id
        Language.find(user.language_id).name
      else
        '-'
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  # Customize show
  show title: :pseudo do
    attributes_table title: t('active_admin.details') do
      rows :pseudo, :email
      row t('user.language') do |user|
        if user.language_id
          Language.find(user.language_id).name
        else
          '-'
        end
      end
      rows :created_at, :updated_at
    end
  end

  # Customize form
  form html: { multiplart: true } do |form|
    form.inputs do
      form.input :pseudo
      form.input :email
      form.input :password
      form.input :password_confirmation
      form.input :language_id, as: :select, collection: Language.all
    end
    form.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :pseudo, :email, :password, :password_confirmation, :language_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:pseudo, :email, :password_digest, :language_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
