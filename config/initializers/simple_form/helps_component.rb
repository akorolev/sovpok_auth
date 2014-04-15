module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module Helps
      # Name of the component method
      def help
        @help ||= begin
           template.fa_icon("question-circle lg").to_s.html_safe if options[:help].present?
        end
      end

      # Used when the number is optional
      def has_help?
        help.present?
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Helps)
