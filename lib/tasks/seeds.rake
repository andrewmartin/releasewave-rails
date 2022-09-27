# rake db:seedOption
# prepares the db with the option value for 'global'
namespace :db do
  desc "seed option"
  task seedOption: [:environment] do
    @option = Option.find_or_create_by!(name: "global")
    if @option.data.nil?
      @data = "{
        featured_date_before: 25,
        featured_date_after: 25,
        upcoming_date_before: 25,
        upcoming_date_after: 25
        }"
      @option.update!(data: @data)
      puts "updated option with defaults: #{@data}"
    end
  end
end
