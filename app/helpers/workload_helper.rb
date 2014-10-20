module WorkloadHelper
  # Calculate the current workload for the current logged in user, and find a percentage. (Only Currently Assigned Tasks)
  def associate_workload_daily
    avl_time = 480
    used_time = Plantask.assigned.where( :associate => current_user.email ).sum :est_time
    ((used_time.to_f / avl_time.to_f) * 100).round.to_s
  end
end