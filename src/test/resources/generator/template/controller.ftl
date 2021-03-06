package ${basePackage}.controller;
import ${basePackage}.core.ResultCore.Result;
import ${basePackage}.core.ResultCore.ResultGenerator;
import ${basePackage}.model.${modelNameUpperCamel};
import ${basePackage}.service.${modelNameUpperCamel}Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.annotation.Resource;
import java.util.List;

/**
* Created by ${author} on ${date}.
*/
@RestController
@RequestMapping("${baseRequestMapping}")
@Api(value = "${modelNameUpperCamel}管理", description = "${modelNameUpperCamel}管理")

public class ${modelNameUpperCamel}Controller {
    @Resource
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;
    @ApiOperation(value = "add${modelNameUpperCamel}")

    @PostMapping(value = "/add",produces = "application/json;charset=UTF-8")
    public Result add(@RequestBody ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.save(${modelNameLowerCamel},true);
        return ResultGenerator.genSuccessResult("保存成功");
    }
    @ApiOperation(value = "delete${modelNameUpperCamel}")

    @PostMapping("/delete")
    public Result delete(@RequestParam String id) {
        ${modelNameLowerCamel}Service.deleteById(id);
        return ResultGenerator.genSuccessResult("删除成功");

    }
    @ApiOperation(value = "update${modelNameUpperCamel}")

    @PostMapping(value = "/update",produces = "application/json;charset=UTF-8")
    public Result update(@RequestBody ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult("更新成功");
    }


    @ApiOperation(value = "detail${modelNameUpperCamel}")

    @PostMapping("/detail")
    public Result detail(@RequestParam String id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
        return ResultGenerator.genSuccessResult(${modelNameLowerCamel});
    }


    @ApiOperation(value = "list${modelNameUpperCamel}")

    @PostMapping("/list")
    public Result list(@RequestBody(required = false) ListQuery params)
    {

        if(params==null){

            List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll();
            return ResultGenerator.genSuccessResult(list);
        }
        else
        {
            PageHelper.startPage(params.getPageNumber(), params.getPageSize());

            List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findByConditionSuperQuery(params);
            PageInfo pageInfo = new PageInfo(list);
            return ResultGenerator.genSuccessResult(pageInfo);

        }


        PageHelper.startPage(params.getPageIndex(), params.getPageSize());

        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findByConditionSuperQuery(params);
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }




    @ApiOperation(value = "获取对象实体")

    @PostMapping("/getObj")

    public Result getObj() {
        return ResultGenerator.genSuccessResult(new ${modelNameUpperCamel}());
    }

}
