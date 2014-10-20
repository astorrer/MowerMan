class ApplicationReport < Prawn::Document
  require "prawn"
  require "prawn/table"
  
  # Often-Used Constants
  TABLE_ROW_COLORS   = ["EFEFEF", "DEDEDE"]
  TABLE_FONT_SIZE    = 9
  TABLE_BORDER_STYLE = :grid
  
  def initialize(default_prawn_options={})
    super(default_prawn_options)
    font_size 10
  end

  def header(title=nil)
    text  "Asama Coldwater Manufacturing | MowerMan", size: 18, style: :bold, align: :center
    if title
      text title, size: 14, style: :bold_italic, align: :center
    end
    text "DO NOT ATTEMPT TO MODIFY THIS DOCUMENT, VALID AS OF:  #{Date.today.to_s}", size: 8, align: :right
  end

  def footer
    text "Copyright ACM", size: 6
  end
end