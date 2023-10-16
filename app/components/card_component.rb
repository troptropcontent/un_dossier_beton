# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer
  renders_one :visual

  def initialize(path: '/', variant: 'classic')
    @variant = variant
    @path = path
  end

  def main_container_classes
    class_names(
      'flex',
      'bg-white',
      'p-4',
      'gap-2',
      'rounded',
      'border',
      'border-gray-200',
      'hover:bg-gray-100',
    )
  end
end
