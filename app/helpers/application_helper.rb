# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def semantic_ui_css_components
    # https://semantic-ui.com/globals/site.html
    globals     = %w[reset site]
    elements    = %w[button container divider header icon image label list
                     segment]
    collections = %w[form grid menu message]
    views       = %w[card]
    modules     = %w[transition]

    globals + elements + collections + views + modules
  end

  def semantic_ui_cdn_for(component, type)
    # https://cdnjs.com/libraries/semantic-ui
    host =    "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui"
    version = "2.4.1"
    "#{host}/#{version}/components/#{component}.min.#{type}"
  end
end
