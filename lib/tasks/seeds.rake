# rake db:seedOption
# prepares the db with the option value for 'global'
namespace :db do
  desc "seed option"
  task seedOption: [:environment] do
    @option = Option.find_or_create_by!(name: "releaseWaveGlobalOptions")
    if @option.data.nil?
      @data = '{
        "featured_date_before": 30,
        "featured_date_after": 30,
        "upcoming_date_before": 21,
        "upcoming_date_after": 21
        }'
      @option.update!(data: @data)
      puts "updated option with defaults: #{@data}"
    end
  end
end
