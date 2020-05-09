ActiveAdmin.register Place do
  # Path to delete the actual image
  member_action :delete_place_image, method: :delete do
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: edit_admin_category_path)
  end

  # Add custom quickly filters in the index page
  scope :all, default: true
  scope(:not_approved) { |scope| scope.where(approved: false) }

  # Customize index
  index do
    selectable_column
    column :title, sortable: "titles->''".insert(-2, I18n.locale.to_s)
    column t('place.approved') do |place|
      place.approved ? t('place.approved_yes') : t('place.approved_no')
    end
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
    column t('place.price') + ' [' + t('place.price_unit') + ']', :price_chf
    column t('place.duration') + ' [' + t('place.duration_unit') + ']', :duration_minutes
    column :schedule, sortable: "schedules->''".insert(-2, I18n.locale.to_s)
    column :description, sortable: "descriptions->''".insert(-2, I18n.locale.to_s)
    column t('place.created_by') do |place|
      place.user_id ? User.find(place.user_id).pseudo : '-'
    end
    column :created_at
    column t('place.updated_by') do |place|
      place.admin_user_id ? AdminUser.find(place.admin_user_id).email : '-'
    end
    column :updated_at
    actions
  end

  # Customize show
  show do
    attributes_table title: t('active_admin.details') do
      row :title
      row t('place.approved') do |place|
        place.approved ? t('place.approved_yes') : t('place.approved_no')
      end
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
      rows :schedule, :description
      row t('place.geometry') do |place|
        link_to "#{place.geometry.y}, #{place.geometry.x}", "http://www.google.com/maps/place/#{place.geometry.y},#{place.geometry.x}", target: '_blank'
      end
      row t('place.created_by') do |place|
        place.user_id ? User.find(place.user_id).pseudo : '-'
      end
      row :created_at
      row t('place.updated_by') do |place|
        place.admin_user_id ? AdminUser.find(place.admin_user_id).email : '-'
      end
      row :updated_at
    end
  end

  # Customize form
  form html: { multiplart: true } do |form|
    form.inputs do
      h3 t('general.general_information')
      translated_input(form, :titles, input_html: { maxlength: '40' })
      if form.object.image.attached?
        form.input :image, as: :file, hint: image_tag(form.object.image, width: '60%')
        div link_to t('messages.delete'), delete_place_image_admin_place_path(form.object.image.id), method: :delete, data: { confirm: t('messages.sure') }, class: 'center'
      else
        form.input :image, as: :file
      end
      form.input :category_ids, as: :check_boxes, collection: Category.all
      form.input :geometry, as: :string
      div link_to 'Google Maps', 'http://www.google.com/maps', class: 'center', target: '_blank'
      h3 t('general.additional_information')
      form.input :price_chf, step: 0.05, min: 0, hint: t('place.price_unit')
      form.input :duration_minutes, min: 0, hint: t('place.duration_unit')
      translated_input(form, :schedules, required: false)
      translated_input(form, :descriptions, required: false)
      form.input :approved, hint: t('place.approved_message')
      form.input :admin_user_id, input_html: { value: current_admin_user.id }, as: :hidden
    end
    form.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :price_chf, :duration_minutes, :geometry, :image, :approved, :admin_user_id, category_ids: [],
                titles: I18n.available_locales, descriptions: I18n.available_locales, schedules: I18n.available_locales
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
