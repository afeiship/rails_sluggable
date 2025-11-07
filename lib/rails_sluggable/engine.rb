require 'active_support/concern'

module RailsSluggable
  class Engine < ::Rails::Engine
    initializer 'rails_sluggable' do
      ActiveSupport.on_load :active_record do
        include RailsSluggable::Model
      end
    end
  end
  
  module Model
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
        
        # Generate unique slug
        uuid = SecureRandom.uuid.gsub('-', separator)
        candidate_slug = separator.present? ? 
          uuid.gsub(/-/, separator)[0, length] : 
          uuid.gsub(/-/, '')[0, length]
        
        # Ensure uniqueness
        while self.class.exists?(slug: candidate_slug)
          candidate_slug = generate_unique_slug(length, separator)
        end
        
        self.slug = candidate_slug
      end

      private

      def generate_unique_slug(length, separator)
        uuid = SecureRandom.uuid.gsub('-', separator)
        separator.present? ? 
          uuid.gsub(/-/, separator)[0, length] : 
          uuid.gsub(/-/, '')[0, length]
      end
    end

    included do
      before_save :generate_slug_if_blank
      class_attribute :slug_options
    end
  end
end