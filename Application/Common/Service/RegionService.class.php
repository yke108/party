<?php
namespace Common\Service;

use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\CodeConst;

class RegionService{
    //获取该镇下面所有的省市区
    public function getlist($code)
    {
        $list = $this->regionDao()->getlist($code);
        if(empty($list))
        {
            return $list = [];
        }
        return $this->tree($list);
    }

    private function tree($list){
        $tree = [];
        $tmp_tree = [];
        foreach ($list as $item) {
                $tmp_tree[$item['region_code']] = $item;
        }
        foreach ($list as $item) {

            preg_match_all('/^(\d+?)(00)*$/', $item['region_code'], $arr);
            $region_code = $arr[1][0];
            $parent_region_code = substr($region_code, 0, -2);
            if (strlen($parent_region_code) <= 6) {
                $parent_region_code = str_pad($parent_region_code, 6, '0');
            } else {
                $parent_region_code = str_pad($parent_region_code, 10, '0');
            }
            if (isset($tmp_tree[$parent_region_code])) {
                $tmp_tree[$parent_region_code]['children'][] = &$tmp_tree[$item['region_code']];
            } else {
                    $tree[] = &$tmp_tree[$item['region_code']];
            }
        }
        unset($tmp_tree);
        return $tree;
    }




    //把省市区分别存入数组
    private function getlevel($list,$code=0)
    {
//        foreach($list as $v)
//        {
//            switch ($v['region_level'])
//            {
//                case '1':
//                    $arr[$v['region_id']] = $v;
//                    $arr['code']
//                    break;
//            }
//            $newcode = $code+2;
//            $one = substr($v['region_code'],0,$newcode);
//            $two = substr($var['region_code'],0,$newcode);
//            print_r($one == $);
//            exit;
//            if($one == $two) $newarr = $this->getlevel($list,$newcode);
//            $arr[$v['region_id']]['child'] = $newarr;
//            return $arr;
//        }
//        foreach($list as $v)
//        {
//            if($v['region_level'] == 1)
//            {
//                $arr[$v['region_id']] = $v;
//                foreach($list as $va)
//                {
//                    if($va['region_level'] == 2)
//                    {
//                        $arr[$v['region_id']]['child'][$va['region_id']] = $va;
//                        foreach($list as $var)
//                        {
//                            $two = substr($va['region_code'],0,4);
//                            $three = substr($var['region_code'],0,4);
//                            if($var['region_level'] == 3 && $two==$three)
//                            {
//                                $arr[$v['region_id']]['child'][$va['region_id']]['child'][$var['region_id']] = $var;
//                            }
//                        }
//                    }
//                }
//            }
//        }
        print_r($arr);
        return $arr;
    }

    public function getZone($region_code, $root = 0){
        $len = strlen($region_code);
        if($len !=6 && $len != 10) {
            return '';
        }
        $codes = [];
        $parr = ['0000', '00', '', '00', ''];
        for($i=0; $i<5; $i++){
            $bn = 2 * ($i + 1);
            if($bn > $len) break;
            $code = substr($region_code, 0, $bn).$parr[$i];
            if($code > $root && $code <= $region_code) {
                $codes[] = $code;
            }
        }
        $map = [
            'region_code'=>['in', $codes],
        ];
        return $this->regionDao()->order('region_code asc')->where($map)->getField('region_id, region_name');
    }

	private function regionDao() {
		return D('Common/Region/Region');
	}
}

