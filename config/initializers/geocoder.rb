Geocoder.configure(
  # Geocoding options
  timeout: 10,                 # geocoding service timeout (secs)
   lookup: :google,            # name of geocoding service (symbol)
  # ip_lookup: :freegeoip,      # name of IP address geocoding service (symbol)
  # language: :en,              # ISO-639 language code
   use_https: true,           # use HTTPS for lookup requests? (if supported)
  # http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
  # https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
   api_key: 'AIzaSyDcH5rzyKn-1wdPz9eernYfF5vgOKIQbok',               # API key for geocoding service
  # cache: nil,                 # cache object (must respond to #[], #[]=, and #del)
  # cache_prefix: 'geocoder:',  # prefix (string) to use for all cache keys

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and Timeout::Error
  # always_raise: [],

  # Calculation options
   units: :km,                 # :km for kilometers or :mi for miles, nota queste impostazione vengono caricate prima dell'avvio del server, ogni modifica non verra vista durante l'esecuzione del server, ma solo al suo riavvio
  # distances: :linear          # :spherical or :linear
)
