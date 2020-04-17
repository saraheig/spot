# To overwrite the default footer of ActiveAdmin
module ActiveAdmin
  module Views
    class Footer < Component
      def build(_namespace)
        super id: 'footer'
        super style: 'text-align: center;'

        div do
          link_to t('buttons.language'), new_language_path
        end
      end
    end
  end
end
