module StringToText
  RSpec.describe Table do

    let(:table_data) { File.read(File.expand_path(File.dirname(__FILE__)) + '/support/table.rb') }
    let(:email_attribute) { Attribute.new("email", "string") }
    let(:password_attribute) { Attribute.new("password", "string") }

    describe "#to_script" do
      let(:table) { Table.new("users", [email_attribute, password_attribute]) }

      it "returns rails generate line" do
        expect(table.to_script).to eq(["change_column :users, :email, :text", "\n", "change_column :users, :password, :text", "\n"])
      end
    end

    describe ".parse" do
      let(:table) { Table.parse(table_data) }
      it "parses given table data" do
        expect(table).to be_kind_of(StringToText::Table)
      end
    end

  end
end