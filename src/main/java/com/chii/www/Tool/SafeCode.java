package com.chii.www.Tool;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SafeCode {
//    public static void main(String[] args) throws NoSuchAlgorithmException {
//        String securePassword = "12345678";
//        long startTime = System.currentTimeMillis();    //获取开始时间
//        for (int i = 0; i < 3; i++) {
//            securePassword = getSha512(securePassword,"");
//            System.out.println(securePassword);
//
//        }
//        long endTime = System.currentTimeMillis();    //获取结束时间
//
//        System.out.println("程序运行时间：" + (endTime - startTime) + "ms");    //输出程序运行时间

    /****************************************************************************/
//        startTime = System.currentTimeMillis();    //获取开始时间
//        String Password = BCrypt.hashpw("123456",BCrypt.gensalt());
//
//        endTime = System.currentTimeMillis();    //获取结束时间
//        System.out.println(Password);
//
//        System.out.println("程序运行时间：" + (endTime - startTime) + "ms");    //输出程序运行时间
//    }
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
