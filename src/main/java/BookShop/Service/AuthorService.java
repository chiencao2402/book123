package BookShop.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Entity.Author;

@Service
public interface AuthorService {

@Autowired
public List<Author> GetDataAuthor();
@Autowired
public int save(Author author);
@Autowired
public int update(Author author);

@Autowired
public int delete(int id);
}