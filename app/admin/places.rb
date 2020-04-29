ActiveAdmin.register Place do
  # Path to delete the actual image
  member_action :delete_place_image, method: :delete do
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: edit_admin_category_path)
  end

  # Customize index
  index do
    selectable_column
    column :title
    column :image do |place|
      if place.image.attached?
        image_tag place.image, width: '100'
      else
        '-'
      end
    end
    column :category_ids do |place|
      place.category_ids.map do |category|
        Category.find(category).title
      end
    end
    column t('place.price') + ' [' + t('place.price_unit') + ']',:price_chf
    column t('place.duration') + ' [' + t('place.duration_unit') + ']', :duration_minutes
    column :schedule
    column :description
    column t('place.created_by') do |place|
      if place.user_id
        User.find(place.user_id).pseudo
      else
        '-'
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
      row :image do |place|
        if place.image.attached?
          image_tag place.image, width: '60%'
        else
          '-'
        end
      end
      row :category_ids do |place|
        place.category_ids.map do |category|
          Category.find(category).title
        end
      end
      row t('place.price') + ' [' + t('place.price_unit') + ']' do |place|
        place.price_chf
      end
      row t('place.duration') + ' [' + t('place.duration_unit') + ']' do |place|
        place.duration_minutes
      end
      rows :schedule, :description, :lat, :lng
      row t('place.created_by') do |place|
        if place.user_id
          User.find(place.user_id).pseudo
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
      h3 t('general.general_information')
      translated_input(form, :titles, input_html: { maxlength: '40'})
      if form.object.image.attached?
        form.input :image, as: :file, hint: image_tag(form.object.image, width: '60%')
        div link_to t('messages.delete'), delete_place_image_admin_place_path(form.object.image.id), method: :delete, data: { confirm: t('messages.sure') }, class: 'center'
      else
        form.input :image, as: :file
      end
      form.input :category_ids, as: :check_boxes, collection: Category.all
      h3 t('general.additional_information')
      form.input :price_chf, step: 0.05, min: 0, hint: 'en CHF'
      form.input :duration_minutes, min: 0, hint: 'en minutes'
      translated_input(form, :schedules, required: false)
      translated_input(form, :descriptions, required: false)
      form.input :lat
      form.input :lng
    end
    form.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :price_chf, :duration_minutes, :lat, :lng, :image, category_ids: [], titles: I18n.available_locales, descriptions: I18n.available_locales, schedules: I18n.available_locales
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
