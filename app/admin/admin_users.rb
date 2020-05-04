ActiveAdmin.register AdminUser do
  # Customize index
  index do
    selectable_column
    column :email
    column :created_at
    column :updated_at
    actions
  end

  # Customize show
  show do
    attributes_table title: t('active_admin.details') do
      rows :email, :created_at, :updated_at
    end
  end

  # Customize form
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  permit_params :email, :password, :password_confirmation
end
