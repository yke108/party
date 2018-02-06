<?php
namespace Common\Basic;
class UserConst{
    const UserTypeNormal = 1; //普通党员
    const UserTypeDeputySecretary = 90; //副书记
    const UserTypeSecretary = 100; //书记
    static $utypes = [
        self::UserTypeNormal=>'普通党员',
        self::UserTypeDeputySecretary=>'副书记',
        self::UserTypeSecretary=>'书记',
    ];

    static function avatar(){
        if(empty($pic)) {
            return DK_DOMAIN.'/static/icons/common/basicprofile.jpg';
        } else {
            return picurl($pic);
        }
    }
}

