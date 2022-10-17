# rake db:seedOption
# prepares the db with the option value for 'global'
namespace :db do
  desc "seed option"
  task seedOption: [:environment] do
    puts "seeding options"
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
    else
      puts "option exists: #{@option.data}"
    end
  end

  desc "seed media"
  task seedMedia: [:environment] do
    @size = Media.all.size
    if @size === 0
      3.times do
        @media = Media.new
        @media.image.attach(
          io: File.open("#{Rails.root.join("app/assets/images/missing.png")}"),
          filename: "missing.png",
        )
        @media.save!
        puts "media created: #{@media.id}"
      end
    else
      puts "media found: #{@size}"
    end
  end
end
