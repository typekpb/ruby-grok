$: << File.join(File.dirname(__FILE__), "..", "..", "..", "lib")
require 'grok'
require 'test/unit'

class MonthPatternsTest < Test::Unit::TestCase
  def setup
    @grok = Grok.new
    path = "#{File.dirname(__FILE__)}/../../../../patterns/base"
    @grok.add_patterns_from_file(path)
    @grok.compile("%{MONTH}")
  end

  def test_months
    months = ["Jan", "January", "Feb", "February", "Mar", "March", "Apr",
              "April", "May", "Jun", "June", "Jul", "July", "Aug", "August",
              "Sep", "September", "Oct", "October", "Nov", "November", "Dec",
              "December"]
    months.each do |month|
      match = @grok.match(month)
      assert_not_equal(false, match, "Expected #{month} to match")
      assert_equal(month, match.captures["MONTH"][0])
    end
  end

end
