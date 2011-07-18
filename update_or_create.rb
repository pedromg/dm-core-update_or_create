module DataMapper
  module Model

    # update_or_create method: finds and updates, or creates;
    #   -upon create, returns the object
    #   -upon update, returns the object (by default, returned True)
    # @param[Hash] Conditions hash for the search query.
    # @param[Hash] Attributes hash with the property value for the update or creation of a new row.
    # @param[Boolean] Merger is a boolean that determines if the conditions are merged with the attributes upon create.
    #   If true, merges conditions to attributes and passes the merge to the create method;
    #   If false, only attributes are passed into the create method
    # @return[Object] DataMapper object 
    def update_or_create(conditions = {}, attributes = {}, merger = true)
      begin
	if (row = first(conditions))
          row.update(attributes)
	  row
	else
	  create(merger ? (conditions.merge(attributes)) : attributes )
	end
      rescue
        false
      end
    end

  end # Module Model
end # Module DataMapper