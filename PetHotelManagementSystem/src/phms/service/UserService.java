package phms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.UserDto;
import phms.dto.UserRoomSizeDto;
import phms.mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	UserMapper userMapper;

	public UserDto selectOneUser(String uId) {
		return userMapper.selectOneUser(uId);
	}

	public List<UserDto> selectAllUser() {
		return userMapper.selectAllUser();
	}

	public int insertUser(UserDto user) {
		return userMapper.insertUser(user);
	}

	public int updateUser(UserDto user) {
		return userMapper.updateUser(user);
	}
	
	public int updateUserRoom(UserDto user) {
		return userMapper.updateUserRoom(user);
	}
	
	public int myPageUpdateUser(UserDto user) {
		return userMapper.myPageUpdateUser(user);
	}

	public int deleteUser(String uId) {
		return userMapper.deleteUser(uId);
	}
	
	public List<UserRoomSizeDto> selectUserRoom(String uId) {
		return userMapper.selectUserRoom(uId);
	}
	
	public List<UserRoomSizeDto> selectUserRoomAll(){
		return userMapper.selectUserRoomAll();
	}
	
	public int deleteUserRoom(String uId) {
		return userMapper.deleteUserRoom(uId);
	}

	public UserDto selectSearchUser(String uName) {
		return userMapper.selectSearchUser(uName);
	}

}
