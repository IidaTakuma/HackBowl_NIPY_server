class AddColumnProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :affiliation1, :string
    add_column :profiles, :affiliation2, :string
    add_column :profiles, :githubID, :string
    add_column :profiles, :QiitaID, :string
    add_column :profiles, :otherURL, :string
  end
end
