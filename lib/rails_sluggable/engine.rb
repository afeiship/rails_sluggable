module RailsSluggable
  class Engine < ::Rails::Engine
    initializer 'rails_sluggable' do
      ActiveSupport.on_load :active_record do
        include RailsSluggable
      end
    end
  end
end