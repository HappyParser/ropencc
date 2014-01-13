# -*- encoding: utf-8 -*-

$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '../lib')

require 'test/unit'
require 'ropencc'

class RopenccTest < Test::Unit::TestCase
    def test_ropencc_open
        cc = Ropencc.open 'zhtw2zhcn_s.ini'
        assert_not_nil cc, 'Ropencc.open should return a handle'
    end

    def test_ropencc_convert
        Ropencc.open 'zhtw2zhcn_s.ini' do |cc|
            rs = cc.convert '新年快樂'

            assert_equal '新年快乐', rs
        end
    end

    def test_ropencc_convert
        Ropencc.open 'zhs2zhtw_vp.ini' do |cc|
            rs = cc.convert '这段话很长，还有标点符号，也能正常转换么？'
            assert_equal '這段話很長，還有標點符號，也能正常轉換麼？', rs
        end
    end

    def test_ropencc_simple_conv
        rs = Ropencc.conv 'trad_to_simp', '新年快樂'
        assert_equal '新年快乐', rs
    end
end
