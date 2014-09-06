class User < ActiveRecord::Base

  def read_csv(file_location)


    CSV.foreach(file_location) do |row|
      ...
    end

    # OR USE array = CSV.read(file_location")

  end


end
