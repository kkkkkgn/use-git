//package com.oauth.authorization.auth;
//
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Lazy;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
//import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
//import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
//import org.springframework.security.oauth2.core.user.OAuth2User;
//import org.springframework.stereotype.Service;
//
//import com.example.triptable.auth.PrincipalUserDetails;
//import com.example.triptable.entity.User;
//import com.example.triptable.repository.UserRepository;
//import com.example.triptable.userinfo.GoogleUserInfo;
//import com.example.triptable.userinfo.KakaoUserInfo;
//import com.example.triptable.userinfo.OAuth2UserInfo;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Service
//@Slf4j
//public class PrincipalOauth2UserService extends DefaultOAuth2UserService{
//
//	@Autowired
//	@Lazy
//	private BCryptPasswordEncoder bCryptPasswordEncoder;
//	
//	@Autowired
//	private UserRepository userRepository;
//	
//	@Override
//	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
//		// System.out.println("userRequest : " + userRequest.getClientRegistration());
//
//		OAuth2User oAuth2User = super.loadUser(userRequest);
//		log.info("getAttributes : {}", oAuth2User.getAttributes());
//
//        OAuth2UserInfo oAuth2UserInfo = null;
//
//        String provider = userRequest.getClientRegistration().getRegistrationId();
//
//        if(provider.equals("google")) {
//            log.info("구글 로그인 요청");
//            oAuth2UserInfo = new GoogleUserInfo( oAuth2User.getAttributes() );
//        } else if(provider.equals("kakao")) {
//            log.info("카카오 로그인 요청");
//            oAuth2UserInfo = new KakaoUserInfo( (Map)oAuth2User.getAttributes() );
//        }
//		
//        String providerId = oAuth2UserInfo.getProviderId();
//        String mail = oAuth2UserInfo.getEmail();
//        String nickname = provider + "_" + providerId;
//        String name = oAuth2UserInfo.getName();
//        
//		User userEntity = userRepository.findByMail(mail);
//		
//		if(userEntity == null) {
//			userEntity = User.builder()
//					.mail(mail)
//					.password("기본비밀번호")
//					.name(name)
//					.nickname(nickname)
//					.role("ROLE_USER")
//					.provider(provider)
//					.build();
//			
//				userRepository.save(userEntity);
//		}
//		
//		
//		return new PrincipalUserDetails(userEntity, oAuth2User.getAttributes());
//	}
//	
//	public Authentication getCurrentUserInfo() {
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		
//		if(authentication != null && authentication.isAuthenticated()) {
//			return authentication;
//		}
//		return null;
//	}
//	
//}
