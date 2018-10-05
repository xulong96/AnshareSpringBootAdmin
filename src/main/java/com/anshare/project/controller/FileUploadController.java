package com.anshare.project.controller;

import com.anshare.project.core.ResultCore.Result;
import com.anshare.project.core.ResultCore.ResultGenerator;
import com.anshare.project.core.Util.FileUtil;
import com.anshare.project.model.Affix;
import com.anshare.project.service.AffixService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * Created by Anshare on 2018/09/27.
 */
@RestController
@RequestMapping("/fileupload")
@Api(value = "上传文件", description = "上传文件")

public class FileUploadController {

    @Resource
    private AffixService affixService;

    /*
     * 通过流的方式上传文件
     * @RequestParam("file") 将name=file控件得到的文件封装成CommonsMultipartFile 对象
     */
    @ApiOperation(value = "上传文件")

    @RequestMapping("fileUpload")

    public Result Upload(@RequestParam("file") MultipartFile file,@RequestParam("MasterID") String MasterID,
                  HttpServletRequest request) {
        String fileName = file.getOriginalFilename();
        String fileExtension = "."+FileUtil.getExtensionName(fileName);
        /*System.out.println("fileName-->" + fileName);
        System.out.println("getContentType-->" + contentType);*/
        String filePath = request.getSession().getServletContext().getRealPath("UploadFiles/");
        System.out.println(filePath);
        try {
            String savename = UUID.randomUUID().toString();

            Affix temp = new Affix();
            temp.setFilename(fileName);
            temp.setFileextension(fileExtension);
            temp.setMasterid(MasterID);
            temp.setSavename(savename+fileExtension);
            FileUtil.uploadFile(file.getBytes(), filePath, temp.getSavename());

            affixService.save(temp);
            return ResultGenerator.genSuccessResult("上传成功");

        } catch (Exception e) {
            // TODO: handle exception
            return ResultGenerator.genFailResult("上传失败");

        }
        //返回json
    }




}