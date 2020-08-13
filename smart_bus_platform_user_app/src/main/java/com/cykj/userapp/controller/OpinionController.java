package com.cykj.userapp.controller;

import com.cykj.pojo.Opinion;
import com.cykj.pojo.User;
import com.cykj.userapp.service.OpinionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

@RequestMapping("opinionController")
@Controller
public class OpinionController {

    @Autowired
    private OpinionService opinionService;

    @RequestMapping("addOpinionImage")
    @ResponseBody
    public String addOpinionImage(HttpServletRequest request, MultipartFile file) {
        User user = (User) request.getSession().getAttribute("user");
        try {
            //获取文件名
            String originalName = file.getOriginalFilename();
            //扩展名
            String prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
            String uuid = UUID.randomUUID()+"";
            String savePath = request.getSession().getServletContext().getRealPath("/opinion");
            //  **/opinion/account/uuid.后缀
            String projectPath = savePath +File.separator + uuid + "." + prefix;

            File files = new File(projectPath);
            //打印查看上传路径
            if (!files.getParentFile().exists()) {//判断目录是否存在
                System.out.println("files11111=" + files.getPath());
                files.getParentFile().mkdirs();
            }
            file.transferTo(files); // 将接收的文件保存到指定文件中
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

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
