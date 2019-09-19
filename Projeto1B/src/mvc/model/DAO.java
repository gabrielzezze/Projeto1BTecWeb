package mvc.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	//Attributes
	private Connection con = null;
	
	//Constructor
	public DAO() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		String url=System.getenv("mysql_url");
		String user=System.getenv("mysql_user");
		String password=System.getenv("mysql_password");

		con = DriverManager.getConnection("jdbc:mysql://172.31.44.51:3306/b39078f88f7f44f0b3f2f863fcb572c4", user,password);
	}
	
	public User createUser(User user) throws SQLException {
		String sql = "INSERT INTO users (name, email, password) values(?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user.getName());
		ps.setString(2, user.getEmail());
		ps.setString(3, user.getPassword());
		ps.execute();
		
		sql = "SELECT id FROM users WHERE email = ? AND password = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, user.getEmail());
		ps.setString(2, user.getPassword());
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			user.setId(rs.getInt("id"));
			return user;
		}
		ps.close();
		return null;
	}
	
	public User getUserById(Integer id) throws SQLException {
		String sql = "SELECT * FROM users WHERE id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			User user;
			try {
				user = new User(rs.getString("name"), rs.getString("email"), rs.getString("password"));
				user.setId(id);
				return user;
			} catch (SQLException e) {
				ps.close();
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		ps.close();
		return null;
	}
	
	public User login(String email, String password) throws SQLException {
		String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			try {
				User user = new User(rs.getString("name"), rs.getString("email"), rs.getString("password"));
				user.setId(rs.getInt("id"));
				return user;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				ps.close();
				e.printStackTrace();
			}
		}
		ps.close();
		return null;
	}
	
	//Card Funcs
	public Card createCard(String title, String description, String status, Integer userId, String duedate) throws SQLException {
		String sql = "SELECT * FROM cards where title = ? AND userId = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, title);
		ps.setInt(2, userId);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			ps.close();
			return null;
		}
		else {
			status = status.replace(" ", "");
			Card card = new Card(title, description, status, userId, duedate);
			if(duedate.equals("")) {
				sql = "INSERT INTO cards (title, description, status, userId) values(?, ?, ?, ?)";
				ps = con.prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, description);
				ps.setString(3, status);
				ps.setInt(4, userId);
				ps.execute();
			}
			else {

				sql = "INSERT INTO cards (title, description, status, userId, duedate) values(?, ?, ?, ?, ?)";
				ps = con.prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, description);
				ps.setString(3, status);
				ps.setInt(4, userId);
				ps.setString(5,duedate);
				ps.execute();
				
			}
			
			sql = "SELECT id FROM cards WHERE title = ? AND userId = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, card.getTitle());
			ps.setInt(2, card.getUserId());
			rs = ps.executeQuery();
			if(rs.next()) {
				card.setId(rs.getInt("id"));
				return card;
			}
			ps.close();
		}
		
		return null;
	}
	
	public List<Card> getCards(Integer id, String status, String filter) throws SQLException{
		String filterFilter = filter == null ? "" : filter.toLowerCase().replace(";", "").replace("--", "");
		String sql = "SELECT title, description, status, userId, id, DATE_FORMAT(duedate, '%d/%m/%Y') duedate FROM cards WHERE userId = ? AND status = ? AND (LOWER(title) LIKE '%"+filterFilter+"%' OR LOWER(description) LIKE '%"+filterFilter+"%') ORDER BY duedate";	
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ps.setString(2, status);
		ResultSet rs = ps.executeQuery();
		List<Card> cards = new ArrayList<Card>();
		while(rs.next()) {
			System.out.println(rs.getString("duedate"));
			Card tempCard = new Card(rs.getString("title"), rs.getString("description"), rs.getString("status"), rs.getInt("userId"), rs.getString("duedate"));
			tempCard.setId(rs.getInt("id"));
			cards.add(tempCard);
			
		}
		
		return cards;
		
	}
	
	public void setCardStatus(Integer id, String newStatus) throws SQLException{
		String sql = "UPDATE cards SET status=? WHERE id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, newStatus);
		ps.setInt(2, id);
		ps.execute();
		
		
	}
	
	public List<String> getAllStatus(Integer id) throws SQLException{
		String sql = "SELECT DISTINCT status FROM cards WHERE userId = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		List<String> allStatus = new ArrayList<String>();
		while(rs.next()) {
			allStatus.add(rs.getString("status"));
		}
		return allStatus;

	}
	
	public void deleteCard(Integer cardId) throws SQLException {
		String sql = "DELETE FROM cards WHERE id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cardId);
		ps.execute();
		ps.close();
	}
	
	public void patchCard(Integer cardId, String title, String description, String status ,String newTitle, String newDescription, String newStatus, String newDuedate) throws SQLException {
		newStatus = newStatus.replace(" ", "");
		String sql;
		if(newDuedate.equals("")) {
			sql = "UPDATE cards SET title=?, description=?, status=? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, newTitle);
			ps.setString(2, newDescription);
			ps.setString(3, newStatus);
			ps.setInt(4, cardId);
			ps.execute();
			ps.close();
		}
		else {
			sql = "UPDATE cards SET title=?, description=?, status=?, duedate=? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, newTitle);
			ps.setString(2, newDescription);
			ps.setString(3, newStatus);
			ps.setString(4, newDuedate);
			ps.setInt(5, cardId);
			ps.execute();
			ps.close();
		}
		
//		if (description.equals("")) {
//			System.out.println("IF");
//			sql = "update cards set description = replace(title, '', ?) where id = ?";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, newDescription);
//			ps.setInt(2, cardId);
//		}
//		else {
//			System.out.println("ELSE");
//			sql = "update cards set description = replace(description, ?, ?) where id = ?";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, description);
//			ps.setString(2, newDescription);
//			ps.setInt(3, cardId);
//		}
//		ps.execute();
//		sql = "update cards set status = replace(status, ?, ?) where id = ?";
//		ps = con.prepareStatement(sql);
//		ps.setString(1, status);
//		ps.setString(2, newStatus);
//		ps.setInt(3, cardId);
//		ps.execute();
	}

}
