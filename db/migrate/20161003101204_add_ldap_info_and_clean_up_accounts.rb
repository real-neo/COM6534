class AddLdapInfoAndCleanUpAccounts < ActiveRecord::Migration
  def change
    
    Account.reset_column_information
    existing_columns = Account.column_names
    
    unless existing_columns.include?('username')
      add_column :accounts, :username, :string 
      add_index :accounts, :username
    end
    
    if existing_columns.include?('email')
      # We don't want the unique index on email which is added by devise by default
      remove_index :accounts, :email
    else
      add_column :accounts, :email, :string 
    end
    add_index :accounts, :email
    
    # Cache the ldap attributes
    missing_columns = %w(uid mail ou dn sn givenname) - existing_columns
    missing_columns.each do |column_name|
      add_column :accounts, column_name, :string
    end
    
    # Remove devise fields we don't need
    unnecessary_columns = %w(reset_password_token reset_password_sent_at remember_created_at encrypted_password) & existing_columns
    unnecessary_columns.each do |column_name|
      remove_column :accounts, column_name
    end
  end
end