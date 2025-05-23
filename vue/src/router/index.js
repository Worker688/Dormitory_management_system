import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

// 解决导航栏或者底部导航tabBar中的vue-router在3.0版本以上频繁点击菜单报错的问题。
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push (location) {
  return originalPush.call(this, location).catch(err => err)
}

const routes = [
  {
    path: '/',
    name: 'Manager',
    component: () => import('../views/Manager.vue'),
    redirect: '/home',  // 重定向到主页
    children: [
      { path: '403', name: 'NoAuth', meta: { name: '无权限' }, component: () => import('../views/manager/403') },
      { path: 'home', name: 'Home', meta: { name: '系统首页' }, component: () => import('../views/manager/Home') },
      { path: 'admin', name: 'Admin', meta: { name: '管理员信息' }, component: () => import('../views/manager/Admin') },
      { path: 'adminPerson', name: 'AdminPerson', meta: { name: '个人信息' }, component: () => import('../views/manager/AdminPerson') },
      { path: 'studentPerson', name: 'StudentPerson', meta: { name: '个人信息' }, component: () => import('../views/manager/StudentPerson') },
      { path: 'password', name: 'Password', meta: { name: '修改密码' }, component: () => import('../views/manager/Password') },
      { path: 'notice', name: 'Notice', meta: { name: '公告信息' }, component: () => import('../views/manager/Notice') },
      { path: 'student', name: 'Student', meta: { name: '学生信息' }, component: () => import('../views/manager/Student') },
      { path: 'building', name: 'Building', meta: { name: '宿舍楼信息' }, component: () => import('../views/manager/Building') },
      { path: 'dormitory', name: 'Dormitory', meta: { name: '宿舍信息' }, component: () => import('../views/manager/Dormitory') },
      { path: 'stay', name: 'Stay', meta: { name: '住宿信息' }, component: () => import('../views/manager/Stay') },
      { path: 'exchanges', name: 'Exchanges', meta: { name: '换寝记录' }, component: () => import('../views/manager/Exchanges') },
      { path: 'fix', name: 'Fix', meta: { name: '寝室报修' }, component: () => import('../views/manager/Fix') },
      { path: 'visit', name: 'Visit', meta: { name: '来访登记' }, component: () => import('../views/manager/Visit') },
      { path: 'electro', name: 'Electro', meta: { name: '电费缴纳' }, component: () => import('../views/manager/Electro') },
    ]
  },
  {
    path: '/front',
    name: 'Front',
    component: () => import('../views/Front.vue'),
    children: [
      { path: 'home', name: 'Home', meta: { name: '系统首页' }, component: () => import('../views/front/Home') },
      { path: 'person', name: 'Person', meta: { name: '个人信息' }, component: () => import('../views/front/Person') },
    ]
  },
  { path: '/login', name: 'Login', meta: { name: '登录' }, component: () => import('../views/Login.vue') },
  { path: '/register', name: 'Register', meta: { name: '注册' }, component: () => import('../views/Register.vue') },
  { path: '*', name: 'NotFound', meta: { name: '无法访问' }, component: () => import('../views/404.vue') },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
