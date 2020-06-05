ActiveAdmin.register Category do
  # Customize index
  index do
    selectable_column
    column :title, sortable: "titles->''".insert(-2, I18n.locale.to_s)
    column :description, sortable: "descriptions->''".insert(-2, I18n.locale.to_s)
    column :place_ids do |category|
      category.place_ids.map do |place|
        Place.find(place).title
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  # Custom controller actions
  controller do
    include SetToParam
    before_action :set_to_param_with_id

    # Destroy action: Category is deleted only if there is not any related places.
    def destroy
      @category = Category.find(params[:id])
      if @category.place_ids.map.count.positive?
        respond_to do |format|
          format.html { redirect_to admin_categories_path, notice: t('messages.category_not_deleted') }
        end
      else
        @category.destroy
        respond_to do |format|
          format.html { redirect_to admin_categories_path, notice: t('messages.category_deleted') }
        end
      end
    end
  end

  # Customize show
  show do
    attributes_table title: t('active_admin.details') do
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
