# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  candidate_with_id = {}
  @candidates.each do |candidate|
    candidate_with_id = candidate if candidate[:id] == id
  end
  puts "Found candidate with id #{id}: #{candidate_with_id}" unless candidate_with_id.empty?
  end
  
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
  end
  
def qualified_candidates(candidates)
    candidates.select { |candidate| experienced?(candidate) && experienced_github_user?(candidate) && knows_languages?(candidate, ['Ruby', 'Python']) && applied_recently?(candidate, 15) && over_17?(candidate)}
  end
  
  # More methods will go below

def experienced_github_user?(candidate)
  candidate[:github_points] >= 100
end

def knows_languages?(candidate, knows_languages)
  (candidate[:languages] & knows_languages).any?
end

def applied_recently?(candidate, max_days_elapsed)
  (Date.today - candidate[:date_applied]).to_i <= max_days_elapsed
end

def over_17?(candidate)
  candidate[:age] > 17
end

def ordered_by_qualifications(candidates)
  candidates.sort { |a, b| [a[:years_of_experience], a[:github_points]] <=> [b[:years_of_experience], b[:github_points]]}
end