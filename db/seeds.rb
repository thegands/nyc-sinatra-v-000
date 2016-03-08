landmarks_list = {
    "BQE" => {
      :year_completed => 1947
    },
    "Holland Tunnel" => {
      :year_completed => -50
    },
    "Wall Street Wall" => {
      :year_completed => 1684
    },
    "Brooklyn Battery Tunnel" => {
      :year_completed => 1973
    }
  }

landmarks_list.each do |name, landmark_hash|
  p = Landmark.new
  p.name = name
  landmark_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

figure_list = {
    "Robert Moses" => {
    },
    "Al Smith" => {
    },
    "Thedore Roosevelt" => {
    },
    "Peter Stuyvesant" => {
    },
    "Boss Tweed" => {
    },
    "Michael Bloomberg" => {
    },
    "Ed Koch" => {
    },
    "Fiorello LaGuardia" => {
    },
    "Jimmy Walker" => {
    },
    "Belle Moskowitz" => {
    }
  }

figure_list.each do |name, figure_hash|
  p = Figure.new
  p.name = name
  p.save
end


title_list = {
    "Mayor" => {
    },
    "President" => {
    },
    "Governor" => {
    },
    "NYC Parks commissioner" => {
    }
  }

title_list.each do |name, figure_hash|
  p = Title.new
  p.name = name
  p.save
end


Title.find(3).figures << Figure.find(2)
Title.find(3).figures << Figure.find(3)
Title.find(2).figures << Figure.find(3)
Title.find(1).figures << Figure.find(9)
Title.find(4).figures << Figure.find(1)
Figure.find(1).landmarks << Landmark.find(1)
Figure.find(5).landmarks << Landmark.find(2)
Figure.find(3).landmarks << Landmark.find(3)
Figure.find(10).landmarks << Landmark.find(4)
