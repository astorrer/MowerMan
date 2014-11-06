class ApplicationController < ActionController::Base  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Filters
  before_filter :configure_permitted_parameters, if: :devise_controller? 
  before_filter :search
  before_filter :access_user
  before_filter :set_locale
  before_filter :check_browser

  before_action do  
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end  

  # Helpers
  helper :all
  helper_method :helpdesk_user,:helpdesk_admin?,:helpdesk_admin_collection

  # Layouts Config
  layout :layout_by_resource

  # Select layouts via the controller.
  def layout_by_resource
    if devise_controller?
      "layout_devise"
    else
      "application"
    end
  end

  def set_locale
    if user_signed_in?
      I18n.locale = @access_user.locale if @access_user.locale.present?
    end
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  def access_user
    if user_signed_in?
      @access_user = current_user
    end
  end

  # Enable SearchKick (ElasticSearch) on Plantasks (Currently set up as the only search.)
  # Bonsai is required for heroku.
  # heroku addons:add bonsai
  # heroku config:add ELASTICSEARCH_URL=`heroku config:get BONSAI_URL`
  def search
    if params[:query].present?
      @plantask_results = Plantask.search(params[:query], misspellings: {edit_distance: 2}, page: params[:page], per_page: 4)
    else
      @plantask_results = Plantask.all.page params[:page]
    end
  end

  # Methods required for the Helpdesk gem
  def helpdesk_user
    current_user
  end

  def helpdesk_admin?
    current_user.has_role? :admin
  end

  def helpdesk_admin_collection
    (Helpdesk.user_class).with_role(:admin)
  end

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) do |u|
       u.permit(:email, :password, :password_confirmation,
                :department_id, :locale)
     end
     devise_parameter_sanitizer.for(:account_update) do |u|
       u.permit(:email, :password, :password_confirmation,
                :current_password, :alert, :department_id, :phone_number, :locale)
     end
   end
   
  private

     Browser = Struct.new(:browser, :version)

     SupportedBrowsers = [
       Browser.new('Safari', '6.0.2'),
       Browser.new('Firefox', '19.0.2'),
       Browser.new('Internet Explorer', '10.0'),
       Browser.new('Internet Explorer', '11.0'),
       Browser.new('Chrome', '25.0.1364.160'),
     ]

     def check_browser
       user_agent = UserAgent.parse(request.user_agent)
       unless SupportedBrowsers.detect { |browser| user_agent >= browser }
         render text: 'Your browser is not supported!'
       end
     end
end
