Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], skip_jwt: true
end

# GOOGLE_CLIENT_ID = 100205689140-q4v0ulp6csvrlpo41gm18o2q2s161voh.apps.googleusercontent.com
# GOOGLE_CLIENT_SECRET = TeW1M_y0pmqPBsl5qFNsxABF