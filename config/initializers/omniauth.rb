OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '935052802620-8gm7q0urc8tcdgpkkeu0oetasd3i1ab1.apps.googleusercontent.com', 'sqAGLa-OoqqLjS9c7wo6sgb9', {hd: 'punahou.edu', client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
