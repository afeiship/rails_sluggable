require 'rails_sluggable/engine'
require 'active_support/concern'

module RailsSluggable
  extend ActiveSupport::Concern

  class_methods do
    def sluggable(options = {})
      include InstanceMethods
      
      # Store configuration per model
      self.slug_options = options
    end
  end

  module InstanceMethods
    def generate_slug_if_blank
      return if slug.present?

      length = self.class.slug_options[:length] || 12
      separator = self.class.slug_options[:separator] || ''
      
      # Generate UUID, remove separators, take specified length
      uuid = SecureRandom.uuid.gsub('-', separator)
      self.slug = separator.present? ? uuid.split(separator)[0..(length-1)].join(separator) : uuid[0, length]
    end

    def save_with_slug
      generate_slug_if_blank
      save
    end
  end

  included do
    before_save :generate_slug_if_blank
    class_attribute :slug_options
  end
end