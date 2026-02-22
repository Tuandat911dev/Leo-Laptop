package com.shop.leolaptop.service.admin;

import com.shop.leolaptop.constant.AuthProvider;
import com.shop.leolaptop.constant.ImageFolder;
import com.shop.leolaptop.constant.RoleName;
import com.shop.leolaptop.domain.Role;
import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.dto.user.*;
import com.shop.leolaptop.mapper.UserMapper;
import com.shop.leolaptop.repository.RoleRepository;
import com.shop.leolaptop.repository.UserRepository;
import com.shop.leolaptop.service.common.FileUploadService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class UserService {
    UserRepository userRepository;
    RoleRepository roleRepository;
    FileUploadService fileUploadService;
    PasswordEncoder passwordEncoder;

    String DEFAULT_AVATAR = "avatar-default.png";

    public User createUser(CreateUserDTO createUserDTO, MultipartFile avatar) {
        User user = UserMapper.createUserDTOtoUser(createUserDTO);
        Role currentRole = roleRepository.findById(createUserDTO.getRoleId())
                .orElseThrow(() -> new RuntimeException("Role Not Found!"));
        user.setRole(currentRole);

        if (Objects.equals(avatar.getOriginalFilename(), "")) {
            user.setAvatar(DEFAULT_AVATAR);
        } else {
            user.setAvatar(fileUploadService.handleUploadSingleFile(avatar, ImageFolder.avatar));
        }

        user.setPassword(passwordEncoder.encode(createUserDTO.getPassword()));

        return userRepository.save(user);
    }

    public User registerNewClient(RegisterDTO registerDTO) {
        User user = UserMapper.registerDtoToUser(registerDTO);
        Role currentRole = roleRepository.findRoleByName(RoleName.CLIENT)
                .orElseThrow(() -> new RuntimeException("Role Not Found!"));
        user.setRole(currentRole);
        user.setAvatar(DEFAULT_AVATAR);
        user.setPassword(passwordEncoder.encode(registerDTO.getPassword()));

        return userRepository.save(user);
    }

    public void updateUser(long id, UpdateUserDTO userDTO, MultipartFile avatar) {
        User currentUser = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found!"));

        Role currentRole = roleRepository.findById(userDTO.getRoleId())
                .orElseThrow(() -> new RuntimeException("Role Not Found!"));

        currentUser.setAddress(userDTO.getAddress());
        currentUser.setPhone(userDTO.getPhone());
        currentUser.setFullName(userDTO.getFullName());
        currentUser.setRole(currentRole);

        if (!Objects.equals(avatar.getOriginalFilename(), "")) {
            currentUser.setAvatar(fileUploadService.handleUploadSingleFile(avatar, ImageFolder.avatar));
        }

        userRepository.save(currentUser);
    }

    public Optional<User> getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public UserDTO getUserById(long id) {
        User user = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User Not Found!"));

        return UserMapper.toUserDTO(user);
    }

    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    public Page<User> getUserWithPagination(int page) {
        PageRequest pageRequest = PageRequest.of(page - 1, 5);

        return userRepository.findAll(pageRequest);
    }

    public void deleteUser(long id) {
        User currentUser = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User Not Found!"));
        userRepository.delete(currentUser);
    }

    public SecurityUserDTO getUserToAuthenticate(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User Not Found"));

        return SecurityUserDTO.builder()
                .id(user.getId())
                .password(user.getPassword())
                .email(user.getEmail())
                .roleName(user.getRole().getName())
                .fullName(user.getFullName())
                .avatar(user.getAvatar())
                .build();
    }

    public User processOAuthPostLogin(String fullName, AuthProvider provider, String providerId, String avatar) {
        if (!userRepository.existsByProviderAndProviderId(provider, providerId)) {
            User user = User.builder()
                    .fullName(fullName)
                    .provider(provider)
                    .avatar(avatar)
                    .providerId(providerId)
                    .build();

            Role currentRole = roleRepository.findRoleByName(RoleName.CLIENT)
                    .orElseThrow(() -> new RuntimeException("Role Not Found!"));
            user.setRole(currentRole);

            return userRepository.save(user);
        } else {
            return userRepository.findByProviderAndProviderId(provider, providerId).orElseThrow(() -> new RuntimeException("User Not Found"));
        }
    }

    public User getUserByProviderAndProviderId(AuthProvider provider, String providerId) {
        return userRepository.findByProviderAndProviderId(provider, providerId).orElseThrow(() -> new RuntimeException("User Not Found"));
    }
}
