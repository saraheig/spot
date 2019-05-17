ActiveAdmin.register Place do
  # Customize form
  form html: { multiplart: true } do |form|
    form.inputs do
      form.input :title
      form.input :description
      form.input :price
      form.input :duration
      form.input :schedule
      form.input :lat
      form.input :lng
      form.input :category_ids, label: I18n.t('activerecord.attributes.place.categories'), as: :check_boxes, collection: Category.all
    end
    form.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :description, :price, :duration, :schedule, :lat, :lng, category_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
