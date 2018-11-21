unless ENV['RAILS_ENV'] == 'production'
  Elasticsearch::Model.client = Elasticsearch::Client.new({
    log: true
  })
else 
  Elasticsearch::Model.client = Elasticsearch::Client.new({
    host: 'apple-934232035.us-east-1.bonsaisearch.net',
    user: 'cvs5jfw6ly',
    password: '9dlb5sk8lg',
    log: true
  })
end
