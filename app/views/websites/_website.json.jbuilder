json.extract! website, :id, :country_id, :url, :company_id, :category, :description, :contacts, :monthly_visits, :country_rank, :valid, :status, :bounce_rate, :created_at, :updated_at
json.url website_url(website, format: :json)
