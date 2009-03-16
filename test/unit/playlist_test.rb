require File.dirname(__FILE__) + '/../test_helper'

class PlaylistTest < Test::Unit::TestCase
  fixtures :playlists, :tracks

  def test_should_return_to_xml_in_xspf_format
    xspf_playlist = <<-EOF
<playlist version=\"1\" xmlns=\"http://xspf.org/ns/0/\">
  <annotation>MyString</annotation>
  <info>MyString</info>
  <title>MyString</title>
  <trackList type=\"array\">
    <track>
      <album>MyString</album>
      <creator>MyString</creator>
      <identifier>MyString</identifier>
      <image>MyString</image>
      <info>MyString</info>
      <location>MyString</location>
      <title>MyString</title>
    </track>
    <track>
      <album>MyString</album>
      <creator>MyString</creator>
      <identifier>MyString</identifier>
      <image>MyString</image>
      <info>MyString</info>
      <location>MyString</location>
      <title>MyString</title>
    </track>
  </trackList>
</playlist>
EOF
    assert_equal xspf_playlist, playlists(:one).to_xml
  end
end
