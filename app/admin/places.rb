ActiveAdmin.register Place do
  # Path to delete the actual image
  member_action :delete_place_image, method: :delete do
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: edit_admin_category_path)
  end

  # Customize form
  form html: { multiplart: true } do |form|
    form.inputs do
      h3 t('general.general_information')
      form.input :title
      if form.object.image.attached?
        form.input :image, as: :file, hint: image_tag(form.object.image)
        span link_to t('messages.delete'), delete_place_image_admin_place_path(form.object.image.id), method: :delete, data: { confirm: t('messages.sure') }
      else
        form.input :image, as: :file
      end
      form.input :category_ids, as: :check_boxes, collection: Category.all
      h3 t('general.additional_information')
      form.input :price_chf, step: 0.05, min: 0, hint: 'en CHF'
      form.input :duration_minutes, min: 0, hint: 'en minutes'
      form.input :schedule
      form.input :description
      form.input :lat
      form.input :lng
    end
    form.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :description, :price_chf, :duration_minutes, :schedule, :lat, :lng, :image, category_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      row :title
      row :image do |place|
        if place.image.attached?
          image_tag place.image
        else
          '-'
        end
      end
      row :category_ids do |place|
        place.category_ids.map do |category|
          Category.find(category).title
        end
      end
      rows :price_chf, :duration_minutes, :schedule, :description, :lat, :lng
    end
  end
end
