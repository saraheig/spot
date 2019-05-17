ActiveAdmin.register Category do
  # Customize form
  form html: { multiplart: true } do |form|
    form.inputs do
      form.input :title
      form.input :description
      form.input :place_ids, label: I18n.t('activerecord.attributes.category.places'), as: :check_boxes, collection: Place.all
    end
    form.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :description, place_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
