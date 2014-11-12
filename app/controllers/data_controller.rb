class DataController < ApplicationController
  before_filter :signed_in_user

  def index

    @connection = ActiveRecord::Base.establish_connection :remote_db
    sql = "select * from v_xml_cdr ORDER BY start_stamp DESC"
    @result = @connection.connection.execute(sql)
    ActiveRecord::Base.establish_connection

  end

end