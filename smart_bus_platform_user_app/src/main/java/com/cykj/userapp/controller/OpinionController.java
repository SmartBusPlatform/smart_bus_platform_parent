package com.cykj.userapp.controller;

import com.cykj.pojo.Opinion;
import com.cykj.pojo.User;
import com.cykj.userapp.service.OpinionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("opinionController")
@Controller
public class OpinionController {

    @Autowired
    private OpinionService opinionService;

    //插入用户投诉建议
    @RequestMapping("addUserOpinion")
    @ResponseBody
    public String addUserOpinion(HttpServletRequest request, String img, String userOpinion ) {
        User user = (User) request.getSession().getAttribute("user");

        Opinion opinion = new Opinion();
        opinion.setUserId(user.getId());
        opinion.setUserOpinion(userOpinion);
        opinion.setOpinionImgUrl(img);

        String str = opinionService.addUserOpinion(opinion);

        return str;
    }
}
