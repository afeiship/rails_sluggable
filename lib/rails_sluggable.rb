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
      
      # 生成唯一的 slug
      self.slug = generate_unique_slug(length, separator)
    end

    private

    def generate_unique_slug(length, separator)
      max_attempts = 10
      attempts = 0
      
      begin
        uuid = SecureRandom.uuid.gsub('-', separator)
        candidate_slug = separator.present? ? 
          uuid.split(separator)[0..(length-1)].join(separator) : 
          uuid[0, length]
        
        attempts += 1
        
        # 检查数据库中是否已存在此 slug
      end while self.class.exists?(slug: candidate_slug) && attempts < max_attempts
      
      # 如果达到最大尝试次数仍未找到唯一 slug，抛出异常
      raise "Unable to generate unique slug after #{max_attempts} attempts" if attempts >= max_attempts
      
      candidate_slug
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