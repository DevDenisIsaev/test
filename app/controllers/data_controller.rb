class DataController < ApplicationController
  before_filter :signed_in_user

  def index
    @param = params[:field]
    sqlorder = ""
    if (!@param.nil?)
      sqlorder = " ORDER BY " + @param + " DESC"
    end
    @connection = ActiveRecord::Base.establish_connection :remote_db
    sql = "select * from v_xml_cdr" + sqlorder
    @result = @connection.connection.execute(sql)
    ActiveRecord::Base.establish_connection

  end

end