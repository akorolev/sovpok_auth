module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module Helps
      # Name of the component method
      def help
        @help ||= begin
           return unless options[:help].present?
           ret = template.link_to(template.help_show_path(:id => label_target), :remote => true ) do
               template.fa_icon("question-circle lg").to_s
           end
           "&nbsp;" + ret.to_s.html_safe
       
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
