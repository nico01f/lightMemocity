json.array!(@memocities) do |memocity|
  json.extract! memocity, :id, :phoneNumberMemo, :contentMemo, :activationDateMemo
  json.url memocity_url(memocity, format: :json)
end
