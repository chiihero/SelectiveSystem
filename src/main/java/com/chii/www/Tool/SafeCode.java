package com.chii.www.Tool;

import org.apache.shiro.crypto.hash.SimpleHash;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SafeCode {
    public static final Long STARTTIME = 10011001L;
        public static void main(String[] args) {

        for (int i=0;i<6;i++) {
//            String salt = String.valueOf((STARTTIME+i));
            String salt = "admin";

            String password = PasswordHash("c6274012383f2674afbff44a332a8896",salt);
            System.out.println("salt\n"+salt +"\npassword\n"+password);
        }
    }
    public static String PasswordHash(String securePassword, String salt) {
        String hash = "SHA-512";
        int hasht = 1024;
        Object info =  new SimpleHash(hash, securePassword, salt,hasht);
//        System.out.println(info);
        return info.toString();
    }

    public static String safe_password(String securePassword, String salt) {
        long startTime = System.currentTimeMillis();    //获取开始时间
        for (int i = 0; i < 1024; i++) {
            securePassword = getSha512(securePassword, salt);
        }
        long endTime = System.currentTimeMillis();    //获取结束时间
        System.out.println(securePassword);
        System.out.println("程序运行时间：" + (endTime - startTime) + "ms");
        return securePassword;
    }

    public static String getSha512(String str, String salt) {
        MessageDigest messagedigest = null;
        try {
            messagedigest = MessageDigest.getInstance("SHA-512");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        messagedigest.update(salt.getBytes());
        byte[] bytes = messagedigest.digest(str.getBytes());
        StringBuilder sb = new StringBuilder();
        for (byte aByte : bytes) {
            sb.append(Integer.toString((aByte & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
    }
}
