tmp = ssm_client.get_parameter(name: '/stage', with_decryption: true).to_h[:parameter][:value].to_s
if tmp != 'prd'
  sql = File.read('./db/sql/database.sql')
  statements = sql.split(/;$/)
  statements.pop

  ActiveRecord::Base.transaction do
    statements.each do |statement|
      connection.execute(statement)
    end
  end
end
