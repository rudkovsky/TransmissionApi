require_relative "test_helper"

class ClientFakeTest < Minitest::Test
  def setup
    @client = TransmissionApi::ClientFake.new({})
  end

  def test_all
    assert_equal( "77831ec368308f1031434c5581a76fd0c3e06cfd", @client.all.first["hashString"] )
  end

  def test_find
    assert_equal( "77831ec368308f1031434c5581a76fd0c3e06cfd", @client.find("77831ec368308f1031434c5581a76fd0c3e06cfd")["hashString"] )
  end

  def test_create
    assert_equal( "77831ec368308f1031434c5581a76fd0c3e06cfd", @client.create("filename")["hashString"] )
  end

  def test_start
    assert_equal( "77831ec368308f1031434c5581a76fd0c3e06cfd", @client.start("77831ec368308f1031434c5581a76fd0c3e06cfd"))
  end

  def test_stop
    assert_equal( "77831ec368308f1031434c5581a76fd0c3e06cfd", @client.stop("77831ec368308f1031434c5581a76fd0c3e06cfd"))
  end

  def test_destroy
    torrents = [
      { "hashString" => "A" },
      { "hashString" => "B" },
      { "hashString" => "C" },
    ]

    @client.expects(:torrents).returns(torrents)

    @client.destroy("B")

    assert_equal(["A", "C"], torrents.map{ |e| e["hashString"] })
  end

end