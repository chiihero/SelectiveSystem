package com.chii.www.shiro.realm;

import com.chii.www.pojo.Admin;
import com.chii.www.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

public class AdminRealm extends AuthorizingRealm {
    @Autowired
    UserService userService;

    /**
     * Retrieves authentication data from an implementation-specific datasource (RDBMS, LDAP, etc) for the given
     * authentication token.
     * <p/>
     * For most datasources, this means just 'pulling' authentication data for an associated subject/user and nothing
     * more and letting Shiro do the rest.  But in some systems, this method could actually perform EIS specific
     * log-in logic in addition to just retrieving data - it is up to the Realm implementation.
     * <p/>
     * A {@code null} return value means that no account could be associated with the specified token.
     *
     * @param token the authentication token containing the user's principal and credentials.
     * @return an {@link AuthenticationInfo} object containing account data resulting from the
     * authentication ONLY if the lookup is successful (i.e. account exists and is valid, etc.)
     * @throws AuthenticationException if there is an error acquiring data or performing
     *                                 realm-specific authentication logic for the specified <tt>token</tt>
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("Admin doGetAuthenticationInfo: " + token);
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;

        String username = upToken.getUsername();
        Admin admin = userService.getAdminInfoById(username);
        if (admin == null) {
            throw new UnknownAccountException("没找到帐号");
        }
        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(
                admin.getAno(),//principal,
                admin.getPassword(),//credentials,
                ByteSource.Util.bytes(admin.getAno()),//credentialsSalt,
                getName()//realmName
        );
        System.out.println("admin SimpleAuthenticationInfo: " + info);

        return info;
    }


    /**
     * Retrieves the AuthorizationInfo for the given principals from the underlying data store.  When returning
     * an instance from this method, you might want to consider using an instance of
     * {@link SimpleAuthorizationInfo SimpleAuthorizationInfo}, as it is suitable in most cases.
     *
     * @param principals the primary identifying principals of the AuthorizationInfo that should be retrieved.
     * @return the AuthorizationInfo associated with this principals.
     * @see SimpleAuthorizationInfo
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("开始Admin权限授权(进行权限验证!!)");
        if (principals == null) {
            throw new AuthorizationException("PrincipalCollection method argument cannot be null.");
        }
        String username = (String) principals.getPrimaryPrincipal();
        Admin admin = userService.getAdminInfoById(username);
        Set<String> roles = new HashSet<>();
        if (admin != null) {
            roles.add("admin");
            roles.add("teacher");
            roles.add("student");
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roles);
        return info;
    }
}
