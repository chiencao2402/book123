package BookShop.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import BookShop.Entity.Categorys;


public interface CategoryService {

@Autowired
public List<Categorys> GetDataCategory();
@Autowired
public int save(Categorys category);
@Autowired
public int update(Categorys category);

@Autowired
public int delete(int id);
}
