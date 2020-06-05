module SetToParam
  extend ActiveSupport::Concern

  # Override to_param for Administration part
  def set_to_param_with_id
    Category.class_eval do
      def to_param
        id.to_s
      end
    end
  end
end
