if Rails.env.development?
  # init remote debugger
  # Byebug.start_server 'localhost', ENV.fetch("BYEBUG_SERVER_PORT", 1048).to_i
end
