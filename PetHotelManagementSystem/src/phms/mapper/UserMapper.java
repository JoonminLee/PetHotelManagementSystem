package phms.mapper;

import phms.dto.UserDto;

public interface UserMapper {
	public UserDto selectOneUser(String uId);
}
