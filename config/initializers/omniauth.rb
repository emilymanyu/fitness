Rails.application.config.middleware.use OmniAuth::Builder do 
   provider :facebook, '222390944793152', '10e4b4d86838485ea2aeb2e80c8f5283'
end