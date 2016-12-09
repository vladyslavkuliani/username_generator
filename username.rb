# Make sure to run the tests in your /spec folder
# Run `rspec /spec/username_spec.rb` to get started.
$user_type = ["user", "seller", "manager", "admin"]
$user_names = []
def format_name(first, last)
  return nil if first.size==0 || last.size==0
  first.gsub!(/\W|\d/, "")
  last.insert(0, first.match(/^\w/).to_s).downcase.gsub(/\W|\d/, "")
end

def format_year(year)
  return nil if year.to_s.size!=4
  year.to_s.match(/.{2}$/).to_s
end

def check_privilege(index=0)
  index = 3 if index>4
  $user_type[index.floor]
end

def user_type_prefix(index=1)
  return "" if index>=0 && index<1
  check_privilege(index) + "-"
end

def build_username(first, last, year, index=0)
  username = user_type_prefix(index)+format_name(first, last) + format_year(year)
  username
end

def generate_username(first, last, year)
  newName = build_username(first, last, year)
  while $user_names.include?(newName) do
    change_part = newName.match(/_.+$/).to_s
    if change_part.size != 0
      version = change_part[1..-1].to_i
      newName.gsub!(change_part, "_"+(version+1).to_s)
    else
      newName += "_1"
    end
  end
  $user_names << newName
  newName
end
