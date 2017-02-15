class QuerySelector
  def initialize(params)
    @params = params
  end

  def set_values
    if @params[:sort] == "location"
      sort_location_query
    elsif @params[:sort] == "interest"
      sort_interest_query
    elsif @params[:location]
      location_city_query
    end
  end

  def sort_location_query
    jobs = Job.all.sort_by(&:city)
    filter = "location"
    topic = "listed by city"
    [jobs, filter, topic]
  end

  def sort_interest_query
    jobs = Job.all.sort_by(&:level_of_interest)
    filter = "interest"
    topic = "listed by level of interest"
    [jobs, filter, topic]

  end

  def location_city_query
    jobs = Job.where(city: params[:location])
    topic = "in #{params[:location]}"
    [jobs, nil, topic]
  end


end
