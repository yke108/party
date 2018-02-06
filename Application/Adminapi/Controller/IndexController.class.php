<?php
namespace Adminapi\Controller;

use Common\Basic\Status;

class IndexController extends FController {
	protected function apiSetCheck(){
		$this->gp_chk = false;
        $this->must_login = false;
	}



	public function indexAction(){
		$list = [];
		//党建专题
		$djzt = [
            'cls'=>DK_PUBLIC_URL.'/icon/党建专题.png',
            'txt'=>'党建专题',
            'menu_code'=>'',
            'itm'=>[
                [
                    'txt'=>'分类管理',
                    'menu_code'=>'category/special',
                ],
//                [
//                    'txt'=>'新添加',
//                    'menu_code'=>'special/add',
//                ],
                [
                    'txt'=>'内容列表',
                    'menu_code'=>'special/index',
                ],
            ]
        ];
		//两学一做
        $lxyz = [
            'cls'=>DK_PUBLIC_URL.'/icon/两学一做.png',
            'txt'=>'两学一做',
            'menu_code'=>'',
            'itm'=>[
                [
                    'txt'=>'分类管理',
                    'menu_code'=>'category/category',
                ],
//                [
//                    'txt'=>'新添加',
//                    'menu_code'=>'category/add',
//                ],
                [
                    'txt'=>'内容列表',
                    'menu_code'=>'category/article',
                ],
            ]
        ];

        //移动学堂
		$ydxt = [
            'cls'=>DK_PUBLIC_URL.'/icon/移动学堂.png',
            'txt'=>'移动学堂',
            'menu_code'=>'',
            'itm'=>[
                [
                    'txt'=>'分类管理',
                    'menu_code'=>'category/study',
                ],
                [
                    'txt'=>'视频管理',
                    'menu_code'=>'video/video_list',
                ],
                [
                    'txt'=>'音频管理',
                    'menu_code'=>'audio/audio_list',
                ],
                [
                    'txt'=>'阅读管理',
                    'menu_code'=>'ebook/ebook_list',
                ],
                [
                    'txt'=>'读书管理',
                    'menu_code'=>'read/read_list',
                ],
                [
                    'txt'=>'评测管理',
                    'menu_code'=>'question/question_list',
                ],
                [
                    'txt'=>'相册管理',
                    'menu_code'=>'photo/photo_list',
                ],
                [
                    'txt'=>'任务管理',
                    'menu_code'=>'tools/option_list',
                ],
            ],
        ];

		//支部管理
        $zhibu = [
            'cls'=>DK_PUBLIC_URL.'/icon/分支管理.png',
            'txt'=>'支部管理',
            'menu_code'=>'',
            'itm'=>[
                [
                    'txt'=>'支部列表',
                    'menu_code'=>'group/group',
                ],
                [
                    'txt'=>'支部审核',
                    'menu_code'=>'group/ex',
                ],
                [
                    'txt'=>'已撤销支部',
                    'menu_code'=>'group/reset',
                ],
            ]
        ];

        //党员管理
        $dangyuan = [
            'cls'=>DK_PUBLIC_URL.'/icon/党员管理.png',
            'txt'=>'党员管理',
            'menu_code'=>'',
            'itm'=>[
                [
                    'txt'=>'党员列表',
                    'menu_code'=>'user/index',
                ],
                [
                    'txt'=>'锁定列表',
                    'menu_code'=>'user/index',
                ],
                [
                    'txt'=>'转出申请',
                    'menu_code'=>'user/index',
                ],
                [
                    'txt'=>'转入审核',
                    'menu_code'=>'user/index',
                ],

            ]
        ];

        //风采管理
		$fengcai = [
			'cls'=>DK_PUBLIC_URL.'/icon/风采管理.png',
			'txt'=>'风采管理',
			'menu_code'=>'',
			'itm'=>[
				[
					'txt'=>'风采列表',
					'menu_code'=>'mien/mien_list',
				],
                [
                    'txt'=>'异常信息',
                    'menu_code'=>'mien/mien_list',
                ],
                [
                    'txt'=>'风采回收站',
                    'menu_code'=>'mien/recovery_list',
                ],
			]
		];
		//活动管理
		$huodong= [
			'cls'=>DK_PUBLIC_URL.'/icon/活动管理.png',
			'txt'=>'活动管理',
			'menu_code'=>'',
			'itm'=>[
				[
					'txt'=>'活动列表',
					'menu_code'=>'even/even_list',
				],
                [
                    'txt'=>'活动审核',
                    'menu_code'=>'even/even_list',
                ],
			]
		];

        //党建数据
        $dangjian = [
            'cls'=>DK_PUBLIC_URL.'/icon/党建专题.png',
            'txt'=>'排行榜',
            'menu_code'=>'',
            'itm'=>[
                [
                    'txt'=>'各类阅读排行',
                    'menu_code'=>'rank/main',
                ],
                [
                    'txt'=>'各类点击排行',
                    'menu_code'=>'rank/main',
                ],
                [
                    'txt'=>'学习排行榜',
                    'menu_code'=>'rank/main',
                ],  [
                    'txt'=>'评测排行榜',
                    'menu_code'=>'rank/main',
                ],
                [
                    'txt'=>'党员综合指数',
                    'menu_code'=>'rank/main',
                ],
                [
                    'txt'=>'支部综合总数',
                    'menu_code'=>'rank/item',
                ],
            ]
        ];

        //公告管理
        $gonggao = [
            'cls'=>DK_PUBLIC_URL.'/icon/公告管理.png',
            'txt'=>'公告管理',
            'menu_code'=>'',
            'itm'=>[
                [
                    'txt'=>'公告列表',
                    'menu_code'=>'notice/notice_list',
                ],
            ]
        ];

        //广告管理
        $guanggao =  [
            'cls'=>DK_PUBLIC_URL.'/icon/广告管理.png',
            'txt'=>'广告管理',
            'menu_code'=>'',
            'itm'=>[
                [
                    'txt'=>'广告列表',
                    'menu_code'=>'ad/ad_list',
                ],
            ],
        ];

        //系统管理
        $xitong = [
            'cls'=>DK_PUBLIC_URL.'/icon/系统管理.png',
            'txt'=>'系统管理',
            'menu_code'=>'',
            'itm'=>[
                [
                    'txt'=>'账户管理',
                    'menu_code'=>'admin/index',
                ],
                [
                    'txt'=>'小程序管理',
                    'menu_code'=>'wx/wxsoft',
                ],
                [
                   'txt'=>'账户操作日志',
                    'menu_code'=>'admin/log',
                ],
//                [
//                    'cls'=>'fa-list',
//                    'txt'=>'积分管理',
//                    'menu_code'=>'',
//                    'itm'=>[
//                        [
//                            'txt'=>'规则设置',
//                            'menu_code'=>'point/rule',
//                        ],
//                        [
//                            'txt'=>'积分流水',
//                            'menu_code'=>'point/log',
//                        ],
//                    ]
//                ],
            ],
        ];

        $list = [$djzt,$lxyz,$ydxt,$zhibu,$dangyuan,$fengcai,$huodong,$dangjian,$gonggao,$guanggao,$xitong];

        $action_list = $this->adminsess['action_list'];
        $action_list = $this->action_list;
//        foreach($list as $kx => $vx) {
//            $g1 = isset($list[$kx]['itm']) ? true : false;
//            if(!$g1) {
//                if(strpos($action_list, ','.$vx['menu_code'].',') === false){
//                    unset($list[$kx]);
//                }
//                continue;
//            }
//            foreach($vx['itm'] as $ky => $vy){
//                $g2 = isset($list[$kx]['itm'][$ky]['itm']) ? true : false;
//                if(!$g2) {
//                    if(strpos($action_list, ','.$vy['menu_code'].',') === false){
//                        unset($list[$kx]['itm'][$ky]);
//                    }
//                    continue;
//                }
//                foreach($vy['itm'] as $kz => $vz){
//                    if(strpos($action_list, ','.$vz['menu_code'].',') === false){
//                        unset($list[$kx]['itm'][$ky]['itm'][$kz]);
//                    } else {
//                        $list[$kx]['itm'][$ky]['itm'][$kz]['menu_code'] = DK_DOMAIN.'/'.$vz['menu_code'];
//                    }
//                }
//                if($g2 && count($list[$kx]['itm'][$ky]['itm']) < 1){
//                    unset($list[$kx]['itm'][$ky]);
//                }
//            }
//            if($g1 && count($list[$kx]['itm']) < 1){
//                unset($list[$kx]);
//            }
//        }

        $data = [
            'is_branch_admin'=>$this->adminsess['branch_id'] > 0 ? 1 : 0,
			'menu_list'=>$list,
			'Display'=>Status::YES,
		];
        $this->jsonReturn($data);
	}

	public function listAction()
	{
		$post = I('post.');

		$list = $this->indexService()->getlist($post);
		$this->jsonReturn($list);
	}


	private function indexService() {
		return D('Index', 'Service');
	}

	public function index_v1Action() {
		$data = [
			'Display'=>Status::YES,
		];
		$this->jsonReturn($data);
	}


}
