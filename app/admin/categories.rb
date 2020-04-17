ActiveAdmin.register Category do
  # Customize index
  index do
    column :title
    column :description
    column :place_ids do |category|
      category.place_ids.map do |place|
        Place.find(place).title
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  # Customize show
  show do
    attributes_table do
      row :title
      row :description
      row :place_ids do |category|
        category.place_ids.map do |place|
          Place.find(place).title
        end
      end
      row :created_at
      row :updated_at
    end
  end

  # Customize form
  form html: { multiplart: true } do |form|
    form.inputs do
      translated_input(form, :titles, input_html: { maxlength: '20', pattern: '[A-Za-z]+' })
      translated_input(form, :descriptions, required: false)
      form.input :place_ids, label: I18n.t('activerecord.attributes.category.places'), as: :check_boxes, collection: Place.all
    end
    form.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params place_ids: [], titles: I18n.available_locales, descriptions: I18n.available_locales
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
