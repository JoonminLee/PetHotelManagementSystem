package phms.mapper;

import java.util.List;

import phms.dto.UserDto;
import phms.dto.UserRoomSizeDto;

public interface UserMapper {
	public UserDto selectOneUser(String uId);

	public List<UserDto> selectAllUser();

	public int insertUser(UserDto user);

	public int updateUser(UserDto user);

	public int deleteUser(String uId);
	
	public List<UserRoomSizeDto> selectUserRoom(String uId);
	
	public List<UserRoomSizeDto> selectUserRoomAll();
	
	public int deleteUserRoom(String uId);
	
}
