package com.chii.www.shiro.realm;

import com.chii.www.pojo.Student;
import com.chii.www.pojo.Student;
import com.chii.www.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

public class StudentRealm extends AuthorizingRealm {
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
        System.out.println("Student doGetAuthenticationInfo: " +token);
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;

        String username = upToken.getUsername();
        Student student = userService.getStuInfoById(username);
        if (student ==null){
            throw new UnknownAccountException("没找到帐号");
        }
        Object principal = student.getSno();
        Object credentials = student.getPassword();
        String realmName =getName();
        ByteSource credentialsSalt = ByteSource.Util.bytes(student.getSno());
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal,credentials,credentialsSalt,realmName);
        System.out.println("Student SimpleAuthenticationInfo: " +info);

        return info;
    }
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("开始student权限授权(进行权限验证!!)");
        if (principals == null) {
            throw new AuthorizationException("PrincipalCollection method argument cannot be null.");
        }
        String username = (String)principals.getPrimaryPrincipal();
        Student student = userService.getStuInfoById(username);
        Set<String> roles = new HashSet<>();
        if (student != null) {
            roles.add("student");
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roles);
        return info;    }
}
