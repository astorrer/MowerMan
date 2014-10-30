class RecordsController < ApplicationController
  before_filter :authenticate_user!
  require 'send_sms'

  def new
    @plantask = Plantask.find(params[:id])
    @record = @plantask.records.build(:status => 'GOOD') 
    @target = @plantask.target.to_s
  end

  def create
    @plantask = Plantask.find(params[:id])
    @record = @plantask.records.build(record_params)

    respond_to do |format|
      if @record.save
        @plantask.update_plantask_status
        @plantask.update_plantask_comment
        @plantask.unassign_plantask
        
        if @record.status == 'ALERT'
          @user = User.all
          @user.each do |user|
            if user.alert
              SendSMS.send(user.phone_number, "#{@plantask.equipment}, #{@record.status}, #{@record.comments}")
            end
          end
        end
        
        format.html { redirect_to mytasks_path, notice: 'You record was created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

    def record_params
      params.require(:record).permit(:status, :data, :comments, :plantask__id)
    end

end
