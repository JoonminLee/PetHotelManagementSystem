package phms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.UserDto;
import phms.mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	UserMapper usermapper;

	public UserDto selectOneUser(String uId) {
		return usermapper.selectOneUser(uId);
	}

	public List<UserDto> selectAllUser() {
		return usermapper.selectAllUser();
	}

	public int insertUser(UserDto user) {
		return usermapper.insertUser(user);
	}

	public int updateUser(UserDto user) {
		return usermapper.updateUser(user);
	}

	public int deleteUser(String uId) {
		return usermapper.deleteUser(uId);
	}

}
