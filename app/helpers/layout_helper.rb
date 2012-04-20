module LayoutHelper

  def page_title
    @page_title ||= "skeletor"
  end
  
  def body_class
    @body_class ||= "#{controller.controller_name} #{controller.action_name}"
  end
  
  def flash_messages
    capture_haml do
      haml_tag :div, :id => "flash" do
        %w(notice alert).each do |msg|
          haml_tag :div, flash[msg.to_sym], :class => msg unless flash[msg.to_sym].blank?
        end
      end
    end
  end
  
end
