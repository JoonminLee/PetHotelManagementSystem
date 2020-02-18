package phms.mapper;

import java.util.List;

import phms.dto.UserDto;

public interface UserMapper {
	public UserDto selectOneUser(String uId);

	public List<UserDto> selectAllUser();

	public int insertUser(UserDto user);

	public int updateUser(UserDto user);

	public int deleteUser(String uId);
}
