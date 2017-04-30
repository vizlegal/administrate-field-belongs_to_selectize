require "administrate/field/belongs_to"
require "rails"

module Administrate
  module Field
    class BelongsToSelectize < BelongsTo
      class Engine < ::Rails::Engine
        initializer "administrate-field-belongs_to_selectize.add_assets" do |app|
          app.config.assets.precompile << "belongs_to_selectize.js" if app.config.respond_to? :assets
          Administrate::Engine.add_javascript "belongs_to_selectize.js" if defined?(Administrate::Engine)
        end
      end

      def html_data
        selectize_options.tap do |data|
          data[:params] = params
          data[:remote] = remote?
          data[:url] = url if url.present?
        end
      end

      def remote?
        url.present?
      end

      private

      def params
        options.fetch :params, {}
      end

      def selectize_options
        options.fetch :selectize_options, {}
      end

      def url
        options.fetch :url, nil
      end
    end
  end
end
