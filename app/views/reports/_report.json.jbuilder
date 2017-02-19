json.extract! report, :id, :name, :kind, :bills, :visa, :date, :created_at, :updated_at
json.url report_url(report, format: :json)