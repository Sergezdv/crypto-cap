class ApplicationJob
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: false
end
