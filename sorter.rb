#encoding: utf-8
require 'sinatra'
require 'json'
require_relative 'people_sorter'

helpers do
  def display_alert
    "<div class='alert alert-error'><button type='button' class='close' data-dismiss='alert'>×</button>#{@error_message}</div>" if @error_message
  end
end


get '/' do
  erb :index
end

post '/sort_people' do
  people_array = params[:people]
  groups_number = params[:group_number]
  @error_message = "Please, fill in the form correctly before submitting!" if !people_array or !groups_number or people_array == "" or groups_number == ""
  unless @error_message
    begin    
      @result_groups = people_result_set = PeopleSorter.new(people_array.values).sort_in_groups_of(groups_number.to_i)
      erb :sorting_results
    rescue Exception => e
      @error_message = "Error: #{e.message}"    
      erb :index
    end
  else
    erb :index
  end  
end
