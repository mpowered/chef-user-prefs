actions :create

# :data_bag is the object to search
# :repo_name is the repo being installed, defaults to resource name
attribute :data_bag, :kind_of => String, :default => "users"
attribute :repo_name, :kind_of => String, :name_attribute => true

def initialize(*args)
  super
  @action = :create
end
