# frozen_string_literal: true

class TokenComponent < ViewComponent::Base
  def initialize(color:)
    @color = color
  end

  def classes
    class_names(
      'text-center',
      'text-xs',
      'text-white',
      'p-2',
      'rounded',
      'w-fit',
      ("bg-green-300" if @color == :success),
      ("bg-red-300" if @color == :danger),
      ("bg-amber-300" if @color == :info),
    )
  end
end
