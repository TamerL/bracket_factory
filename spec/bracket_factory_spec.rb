require 'rspec/autorun'
require './src/bracket_factory.rb'

describe '#bracket_factory' do
  context 'Adds the missing bracket in the right sequence,' do
    it 'returns this string [{(B)}{(B)(B)}] when entering [{(B}{(B)(B)}]' do
      expect(bracket_factory("[{(B}{(B)(B)}]")).to eq("[{(B)}{(B)(B)}]")
    end
    it 'returns this string [{(B)}{(B)(B)}] when entering {(B)}{(B)(B)}]' do
      expect(bracket_factory("{(B)}{(B)(B)}]")).to eq("[{(B)}{(B)(B)}]")
    end

    it 'raises an error if the input is not in the brackets format' do
      expect do
        bracket_factory(nil)
      end.to raise_error("Please enter a valid bracket string")
    end
  end
end
