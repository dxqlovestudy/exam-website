import { createRouter, createWebHistory } from "vue-router";

const routes = [
  { path: "/", redirect: "/login" },
  { path: "/login", component: () => import("@/views/login/Login.vue") },
  {
    path: "/student",
    component: () => import("@/views/student/Student.vue"),
    children: [
      {
        path: "home",
        component: () => import("@/views/student/child/TestRecords.vue"),
      },
    ],
  },
  {
    path: "/exercise",
    component: () => import("@/views/exercise/SelfExercise.vue"),
  },
  {
    path: "/score/:id",
    component: () => import("@/views/exercise/Score.vue"),
  },
  {
    path: "/review",
    component: () => import("@/views/exercise/Review.vue"),
  },
  { path: "/teacher", component: () => import("@/views/teacher/Teacher.vue") },
  { path: "/manager", component: () => import("@/views/manager/Manager.vue") },
  { path: "/test", component: () => import("@/views/Test.vue") },
  {path: "/register",component: () => import("@/components/register/Register.vue")}
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
