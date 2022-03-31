package com.whpu.utils;

import com.whpu.module.loginAndResgiter.dao.pojo.User;

/**
 * @description
 * @author: 唉 烁
 * @time: 2021/10/29 10:35
 */
public class UserThreadLocal {


    /**
     * 线程变量隔离，来使用，不同的线程不同的变量
     */
    private UserThreadLocal() {
    }

    private static final ThreadLocal<User> LOCAL = new ThreadLocal<>();

    public static void put(User user) {
        LOCAL.set(user);
    }

    public static User get() {
        return LOCAL.get();
    }

    public static void remove() {
        LOCAL.remove();
    }
}
