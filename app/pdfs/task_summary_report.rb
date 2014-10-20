class TaskSummaryReport < ApplicationReport

  # Constants
  TABLE_HEADERS = [["Status", "Created", "Data", "Comments"]]

  def initialize(plantask, view)
    super()
    @plantask = plantask
    @view = view

    header 'Task Summary Report'

    equip_name
    equip_number
    task_number

    display_records_table
    
    footer
  end

  def equip_number
    text "Equipment \##{@plantask.equip_number}", size: 30, style: :bold
  end

  def equip_name
    text @plantask.equipment, size: 14, style: :italic
  end

  def task_number
    text "Task ID \##{@plantask.id}", size: 20, style: :bold
  end

  def display_records_table
    if record_table_data.empty?
      text "No Records Found"
    else
      data = TABLE_HEADERS
      data += record_table_data
      table(data, :header => true)
    end
  end

  def record_table_data
    record_table_data ||= @plantask.records.limit(10).map { |r| [r.status.to_s, r.created_at.to_s, r.data.to_s, r.comments.to_s] }
  end
end