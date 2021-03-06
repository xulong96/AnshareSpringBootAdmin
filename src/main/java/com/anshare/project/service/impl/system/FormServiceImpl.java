package com.anshare.project.service.impl.system;

import com.anshare.project.dao.system.FormMapper;
import com.anshare.project.model.system.Form;
import com.anshare.project.service.inter.system.FormService;
import com.anshare.project.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * Created by Anshare on 2018/11/01.
 */
@Service
@Transactional
public class FormServiceImpl extends AbstractService<Form> implements FormService {
    @Resource
    private FormMapper formMapper;
    public List<Map<String,Object>> getTables(){

        return  formMapper.getTables();

    }
    public List<Map<String,Object>> getObj(String tablename){

        return  formMapper.getObj(tablename);

    }
}
