ActiveAdmin.register Place do
  # Customize form
  form html: { multiplart: true } do |form|
    form.inputs do
      form.input :title
      form.input :description
      form.input :price_chf, step: 0.05, min: 0, hint: 'en CHF'
      form.input :duration_minutes, min: 0, hint: 'en minutes'
      form.input :schedule
      form.input :lat
      form.input :lng
      form.input :category_ids, as: :check_boxes, collection: Category.all
    end
    form.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :description, :price_chf, :duration_minutes, :schedule, :lat, :lng, category_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
