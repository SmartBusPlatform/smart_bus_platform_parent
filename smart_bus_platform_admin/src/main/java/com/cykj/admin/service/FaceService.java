package com.cykj.admin.service;

import com.cykj.admin.bean.FaceInfo;

public interface FaceService {
    //司机出站打卡
    int driverSign(FaceInfo faceInfo);

}
