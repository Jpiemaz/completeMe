class ReputationChangeObserver
  def update(changed_data)
    MeritNotification.create(
      user: user(changed_data),
      description: description(changed_data),
      reason: reason(changed_data),
      time: time(changed_data)
      )
  end

  private

  def user(changed_data)
    if changed_data[:merit_object]
      sash_id = changed_data[:merit_object].sash_id
      User.where(sash_id: sash_id).first
    end
  end

  def description(changed_data)
    changed_data[:description]
  end

  def reason(changed_data)
    merit_action = Merit::Action.find changed_data[:merit_action_id]
    plural_model_name = merit_action.target_model
    action = merit_action.action_method
    "#{plural_model_name}_#{action}"
  end

  def time(changed_data)
    merit_action = Merit::Action.find changed_data[:merit_action_id]
    merit_action.created_at
  end
end
