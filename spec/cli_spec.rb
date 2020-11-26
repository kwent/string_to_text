module StringToText
  RSpec.describe CLI do

    let(:empty_schema_file) { File.expand_path(File.dirname(__FILE__)) + '/support/empty_schema.rb' }
    let(:schema_file) { File.expand_path(File.dirname(__FILE__)) + '/support/schema.rb' }

    describe ".start" do
      it "prints help message" do
        expect {
          begin
            StringToText::CLI.start("-h")
          rescue SystemExit
          end
        }.to output(/Usage:/).to_stdout
      end

      it "prints file not found message" do
        expect {
          begin
            StringToText::CLI.start("-p", "/support/schema.rb")
          rescue SystemExit
          end
        }.to output(/Unable to open file /).to_stdout
      end

      it "prints could not find tables message" do
        expect {
          begin
            StringToText::CLI.start("-p", empty_schema_file)
          rescue SystemExit
          end
        }.to output(/Could not find tables /).to_stdout
      end

      context "choose table" do
        before do
          allow(STDIN).to receive(:gets) { "" }
        end

        it "prints Not a valid input message" do
          expect {
            begin
              StringToText::CLI.start("-p", schema_file)
            rescue SystemExit
            end
          }.to output(/Not a valid input/).to_stdout
        end
      end

      context "choose all tables" do
        before do
          allow(STDIN).to receive(:gets).once { "*" }
        end

        it "prints string_to_textlines message" do
          expect {
            begin
              StringToText::CLI.start("-p", schema_file)
            rescue SystemExit
            end
          }.to output(/Script/).to_stdout
        end
      end

    end

    describe ".parse_arguments" do
      it "handles wrong arguments" do
        expect {
          begin
            StringToText::CLI.parse_arguments(["--help"])
          rescue SystemExit
          end
        }.to output(/Wrong set of arguments/).to_stdout
      end

      context "handles arguments" do
        it "help argument" do
          expect(CLI.parse_arguments(["-h"])).to eq({clipboard: nil, help: "-h", path: nil})
        end

        it "path argument" do
          expect(CLI.parse_arguments(["-p", "/some/path"])).to eq({clipboard: nil, help: nil, path: "/some/path"})
        end

        it "clipboard argument" do
          expect(CLI.parse_arguments(["-c"])).to eq({clipboard: "-c", help: nil, path: nil})
        end
      end
    end
  end
end
