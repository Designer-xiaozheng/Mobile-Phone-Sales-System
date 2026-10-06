import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
import register from '../views/register.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},

	// 注册
	{
		path: '/register',
		name: 'register',
		component: register,
		meta: {
			index: 0,
			title: '注册'
		}
	},

	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},








	// 教师用户路由
	{
		path: '/teacher_users/table',
		name: 'teacher_users_table',
		component: () => import('../views/teacher_users/table.vue'),
		meta: {
			index: 0,
			title: '教师用户列表'
		}
	},
	{
		path: '/teacher_users/view',
		name: 'teacher_users_view',
		component: () => import('../views/teacher_users/view.vue'),
		meta: {
			index: 0,
			title: '教师用户详情'
		}
	},
	// 学生用户路由
	{
		path: '/student_users/table',
		name: 'student_users_table',
		component: () => import('../views/student_users/table.vue'),
		meta: {
			index: 0,
			title: '学生用户列表'
		}
	},
	{
		path: '/student_users/view',
		name: 'student_users_view',
		component: () => import('../views/student_users/view.vue'),
		meta: {
			index: 0,
			title: '学生用户详情'
		}
	},
	// 课题小组路由
	{
		path: '/research_group/table',
		name: 'research_group_table',
		component: () => import('../views/research_group/table.vue'),
		meta: {
			index: 0,
			title: '课题小组列表'
		}
	},
	{
		path: '/research_group/view',
		name: 'research_group_view',
		component: () => import('../views/research_group/view.vue'),
		meta: {
			index: 0,
			title: '课题小组详情'
		}
	},
	// 小组学生路由
	{
		path: '/group_students/table',
		name: 'group_students_table',
		component: () => import('../views/group_students/table.vue'),
		meta: {
			index: 0,
			title: '小组学生列表'
		}
	},
	{
		path: '/group_students/view',
		name: 'group_students_view',
		component: () => import('../views/group_students/view.vue'),
		meta: {
			index: 0,
			title: '小组学生详情'
		}
	},
	// 项目任务路由
	{
		path: '/project_tasks/table',
		name: 'project_tasks_table',
		component: () => import('../views/project_tasks/table.vue'),
		meta: {
			index: 0,
			title: '项目任务列表'
		}
	},
	{
		path: '/project_tasks/view',
		name: 'project_tasks_view',
		component: () => import('../views/project_tasks/view.vue'),
		meta: {
			index: 0,
			title: '项目任务详情'
		}
	},
	// 立项审批路由
	{
		path: '/project_approval/table',
		name: 'project_approval_table',
		component: () => import('../views/project_approval/table.vue'),
		meta: {
			index: 0,
			title: '立项审批列表'
		}
	},
	{
		path: '/project_approval/view',
		name: 'project_approval_view',
		component: () => import('../views/project_approval/view.vue'),
		meta: {
			index: 0,
			title: '立项审批详情'
		}
	},
	// 立项答辩路由
	{
		path: '/project_proposal_defense/table',
		name: 'project_proposal_defense_table',
		component: () => import('../views/project_proposal_defense/table.vue'),
		meta: {
			index: 0,
			title: '立项答辩列表'
		}
	},
	{
		path: '/project_proposal_defense/view',
		name: 'project_proposal_defense_view',
		component: () => import('../views/project_proposal_defense/view.vue'),
		meta: {
			index: 0,
			title: '立项答辩详情'
		}
	},
	// 中期检测路由
	{
		path: '/intermediate_testing/table',
		name: 'intermediate_testing_table',
		component: () => import('../views/intermediate_testing/table.vue'),
		meta: {
			index: 0,
			title: '中期检测列表'
		}
	},
	{
		path: '/intermediate_testing/view',
		name: 'intermediate_testing_view',
		component: () => import('../views/intermediate_testing/view.vue'),
		meta: {
			index: 0,
			title: '中期检测详情'
		}
	},
	// 验收检验路由
	{
		path: '/acceptance_inspection/table',
		name: 'acceptance_inspection_table',
		component: () => import('../views/acceptance_inspection/table.vue'),
		meta: {
			index: 0,
			title: '验收检验列表'
		}
	},
	{
		path: '/acceptance_inspection/view',
		name: 'acceptance_inspection_view',
		component: () => import('../views/acceptance_inspection/view.vue'),
		meta: {
			index: 0,
			title: '验收检验详情'
		}
	},
	// 结项审批路由
	{
		path: '/closing_approval/table',
		name: 'closing_approval_table',
		component: () => import('../views/closing_approval/table.vue'),
		meta: {
			index: 0,
			title: '结项审批列表'
		}
	},
	{
		path: '/closing_approval/view',
		name: 'closing_approval_view',
		component: () => import('../views/closing_approval/view.vue'),
		meta: {
			index: 0,
			title: '结项审批详情'
		}
	},
	// 成果认证路由
	{
		path: '/achievement_certification/table',
		name: 'achievement_certification_table',
		component: () => import('../views/achievement_certification/table.vue'),
		meta: {
			index: 0,
			title: '成果认证列表'
		}
	},
	{
		path: '/achievement_certification/view',
		name: 'achievement_certification_view',
		component: () => import('../views/achievement_certification/view.vue'),
		meta: {
			index: 0,
			title: '成果认证详情'
		}
	},
	// 论文开题路由
	{
		path: '/paper_proposal/table',
		name: 'paper_proposal_table',
		component: () => import('../views/paper_proposal/table.vue'),
		meta: {
			index: 0,
			title: '论文开题列表'
		}
	},
	{
		path: '/paper_proposal/view',
		name: 'paper_proposal_view',
		component: () => import('../views/paper_proposal/view.vue'),
		meta: {
			index: 0,
			title: '论文开题详情'
		}
	},
	// 论文检验路由
	{
		path: '/paper_verification/table',
		name: 'paper_verification_table',
		component: () => import('../views/paper_verification/table.vue'),
		meta: {
			index: 0,
			title: '论文检验列表'
		}
	},
	{
		path: '/paper_verification/view',
		name: 'paper_verification_view',
		component: () => import('../views/paper_verification/view.vue'),
		meta: {
			index: 0,
			title: '论文检验详情'
		}
	},
	// 结题验收路由
	{
		path: '/final_acceptance/table',
		name: 'final_acceptance_table',
		component: () => import('../views/final_acceptance/table.vue'),
		meta: {
			index: 0,
			title: '结题验收列表'
		}
	},
	{
		path: '/final_acceptance/view',
		name: 'final_acceptance_view',
		component: () => import('../views/final_acceptance/view.vue'),
		meta: {
			index: 0,
			title: '结题验收详情'
		}
	},
	// 实验数据路由
	{
		path: '/experimental_data/table',
		name: 'experimental_data_table',
		component: () => import('../views/experimental_data/table.vue'),
		meta: {
			index: 0,
			title: '实验数据列表'
		}
	},
	{
		path: '/experimental_data/view',
		name: 'experimental_data_view',
		component: () => import('../views/experimental_data/view.vue'),
		meta: {
			index: 0,
			title: '实验数据详情'
		}
	},
	// 实验类型路由
	{
		path: '/experiment_type/table',
		name: 'experiment_type_table',
		component: () => import('../views/experiment_type/table.vue'),
		meta: {
			index: 0,
			title: '实验类型列表'
		}
	},
	{
		path: '/experiment_type/view',
		name: 'experiment_type_view',
		component: () => import('../views/experiment_type/view.vue'),
		meta: {
			index: 0,
			title: '实验类型详情'
		}
	},
	// 论文类型路由
	{
		path: '/paper_type/table',
		name: 'paper_type_table',
		component: () => import('../views/paper_type/table.vue'),
		meta: {
			index: 0,
			title: '论文类型列表'
		}
	},
	{
		path: '/paper_type/view',
		name: 'paper_type_view',
		component: () => import('../views/paper_type/view.vue'),
		meta: {
			index: 0,
			title: '论文类型详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "研究生科研文档资料管理系统-admin";
	document.title = title;
})

export default router
