module DataMapper
  module Model

    # update_or_create method: finds and updates, or creates;
    #   -upon create, returns the object
    #   -upon update, returns the object (by default, returned True)
    # 
    # Params:
    #   -merger is a boolean that determines if the conditions are merged with the attributes upon create;
    #   -merge = true => merges conditions to attributes and passes the merge to the create method
    #   -merge = false => only attributes are passed into the create method
    #
    # Older implementation:
    #   (first(conditions) && first(conditions).update(attributes)) || create(merger ? (conditions.merge(attributes)) : attributes )
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