package com.whpu.utils;

import io.jsonwebtoken.*;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/27 23:16
 */
public class JWTUtils {
    private static final String jwtToken = "123456@whpu";

    public static String creatToken(String userId) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("userId", userId);
        JwtBuilder jwtBuilder = Jwts.builder()
                .signWith(SignatureAlgorithm.HS512, jwtToken)//签发算法，密钥为jwtToken
                .setClaims(claims)//body数据，要唯一，自行设置
                .setIssuedAt(new Date())//设置签发时间
                .setExpiration(new Date(System.currentTimeMillis() + 24 * 60 * 60 * 1000));//设置过期时间
        String token = jwtBuilder.compact();
        System.out.println(token + "---------------------------------");
        return token;
    }

    public static Map<String, Object> checkToken(String token) {
        if (token == null) {
            System.out.println(token);
        }
        System.out.println(token);
        try {
            Jwt parse = Jwts.parser().setSigningKey(jwtToken).parse(token);
            return (Map<String, Object>) parse.getBody();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
