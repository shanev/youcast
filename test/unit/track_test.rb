require File.dirname(__FILE__) + '/../test_helper'

class TrackTest < Test::Unit::TestCase
  fixtures :tracks

  def test_should_return_to_xml_in_xspf_format
    track_xml = <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<track>
  <album>MyString</album>
  <creator>MyString</creator>
  <identifier>MyString</identifier>
  <image>MyString</image>
  <info>MyString</info>
  <location>MyString</location>
  <title>MyString</title>
</track>
EOF
    assert_equal track_xml, tracks(:one).to_xml
  end
end
