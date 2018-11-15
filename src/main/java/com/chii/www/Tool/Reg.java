package com.chii.www.Tool;

import java.util.regex.Pattern;

public class Reg {
    private static String reg = "(?:')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)|"
            + "(\\b(select|update|union|and|or|delete|insert|trancate|char|into|substr|ascii|declare|exec|count|master|into|drop|execute)\\b)";

    private static Pattern sqlPattern = Pattern.compile(reg, Pattern.CASE_INSENSITIVE);

    public boolean isValid(String str) {
        if (sqlPattern.matcher(str).find()) {
            System.out.println("未能通过过滤器：str=" + str);
            return false;
        }
        return true;

    }
}