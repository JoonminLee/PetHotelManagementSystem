package phms.service;

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
}
