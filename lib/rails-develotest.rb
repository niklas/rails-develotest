require "rails-develotest/version"

module Develotest
  Positive = %w(true yes y 1 yeah jawoll si)
  def self.enabled?
    environment_variable_enabled?
  end

  def self.environment_variable_enabled?
    Positive.include? ENV['DEVELOTEST'].to_s
  end

  # run this from your App::Application.configure blog in config/environments/*
  def self.setup(config)
    if enabled?
      config.cache_classes = false
      config.assets.compress = false
      config.assets.debug = true
    end
  end
end
