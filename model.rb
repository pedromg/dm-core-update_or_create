module DataMapper
  module Model

    # update_or_create method: finds and updates, or creates;
    # merger is a boolean that determines if the conditions are merged with the attributes upon create;
    # merge = true => merges conditions to attributes and passes the merge to the create method
    # merge = false => only attributes are passed into the create method
    def update_or_create(conditions = {}, attributes = {}, merger = true)
      (first(conditions) && update(attributes)) || create(merger ? (conditions.merge(attributes)) : attributes )
    end

  end # Module Model
end # Module DataMapper
