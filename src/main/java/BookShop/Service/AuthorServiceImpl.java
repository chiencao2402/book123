package BookShop.Service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.AuthorDao;
import BookShop.Entity.Author;

@Service
public class AuthorServiceImpl implements AuthorService{
	@Autowired
	private AuthorDao authorDao;
	@Override
	public List<Author> GetDataAuthor() {
		// TODO Auto-generated method stub
		return authorDao.GetDataAuthor();
	}

	@Override
	public int save(Author author) {
		// TODO Auto-generated method stub
		return authorDao.save(author);
	}

	@Override
	public int update(Author author) {
		// TODO Auto-generated method stub
		return authorDao.update(author);
	}



	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return authorDao.delete(id);
	}


	
}
