module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module Prefixes
      # Name of the component method
      def prefix
        @prefix ||= begin
          return unless options[:prefix].present?
          ret = template.content_tag(:span, options[:prefix], class: "prefix")
        end
      end
      # Used when the number is optional
      def has_prefix?
        prefix.present?
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Prefixes)
