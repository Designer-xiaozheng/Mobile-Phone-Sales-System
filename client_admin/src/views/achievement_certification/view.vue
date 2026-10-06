<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','group_name') || $check_field('add','group_name') || $check_field('set','group_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="小组名称" prop="group_name">
												<el-input id="group_name" v-model="form['group_name']" placeholder="请输入小组名称"
							  v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','group_name')) || (!form['achievement_certification_id'] && $check_field('add','group_name'))" :disabled="disabledObj['group_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','group_name')">{{form['group_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','group_type') || $check_field('add','group_type') || $check_field('set','group_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="小组类型" prop="group_type">
												<el-input id="group_type" v-model="form['group_type']" placeholder="请输入小组类型"
							  v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','group_type')) || (!form['achievement_certification_id'] && $check_field('add','group_type'))" :disabled="disabledObj['group_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','group_type')">{{form['group_type']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','group_teacher') || $check_field('add','group_teacher') || $check_field('set','group_teacher')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="小组教师" prop="group_teacher">
													<el-select v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','group_teacher')) || (!form['achievement_certification_id'] && $check_field('add','group_teacher'))" id="group_teacher" v-model="form['group_teacher']" :disabled="disabledObj['group_teacher_isDisabled']">
							<el-option v-for="o in list_user_group_teacher" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','group_teacher')" id="group_teacher" v-model="form['group_teacher']" :disabled="true">
							<el-option v-for="o in list_user_group_teacher" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teachers_name') || $check_field('add','teachers_name') || $check_field('set','teachers_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师姓名" prop="teachers_name">
												<el-input id="teachers_name" v-model="form['teachers_name']" placeholder="请输入教师姓名"
							  v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','teachers_name')) || (!form['achievement_certification_id'] && $check_field('add','teachers_name'))" :disabled="disabledObj['teachers_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teachers_name')">{{form['teachers_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_users') || $check_field('add','student_users') || $check_field('set','student_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生用户" prop="student_users">
													<el-select v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','student_users')) || (!form['achievement_certification_id'] && $check_field('add','student_users'))" id="student_users" v-model="form['student_users']" :disabled="disabledObj['student_users_isDisabled']">
							<el-option v-for="o in list_user_student_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','student_users')" id="student_users" v-model="form['student_users']" :disabled="true">
							<el-option v-for="o in list_user_student_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_name') || $check_field('add','student_name') || $check_field('set','student_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生姓名" prop="student_name">
												<el-input id="student_name" v-model="form['student_name']" placeholder="请输入学生姓名"
							  v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','student_name')) || (!form['achievement_certification_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','student_name')">{{form['student_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','result_name') || $check_field('add','result_name') || $check_field('set','result_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="成果名称" prop="result_name">
												<el-input id="result_name" v-model="form['result_name']" placeholder="请输入成果名称"
							  v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','result_name')) || (!form['achievement_certification_id'] && $check_field('add','result_name'))" :disabled="disabledObj['result_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','result_name')">{{form['result_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','result_type') || $check_field('add','result_type') || $check_field('set','result_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="成果类型" prop="result_type">
												<el-input id="result_type" v-model="form['result_type']" placeholder="请输入成果类型"
							  v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','result_type')) || (!form['achievement_certification_id'] && $check_field('add','result_type'))" :disabled="disabledObj['result_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','result_type')">{{form['result_type']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','achievement_attachment') || $check_field('add','achievement_attachment') || $check_field('set','achievement_attachment')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="成果附件" prop="achievement_attachment">
												<div v-if="disabledObj['achievement_attachment_isDisabled']">
						<div v-if="$check_field('get','achievement_attachment')">
							<el-button type="primary" @click="$download($fullUrl(form['achievement_attachment']),form['achievement_attachment'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
					<div v-else>
						<el-upload v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','achievement_attachment')) || (!form['achievement_certification_id'] && $check_field('add','achievement_attachment'))" class="upload-demo" drag
								   action="" style="max-width: 300px;width: 100%;" :http-request="upload_achievement_attachment" :limit="1" accept="">
							<i class="el-icon-upload"></i>
							<div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
						</el-upload>
						<div v-else-if="$check_field('get','achievement_attachment')">
							<el-button type="primary" @click="$download($fullUrl(form['achievement_attachment']),form['achievement_attachment'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','certification_time') || $check_field('add','certification_time') || $check_field('set','certification_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="认证时间" prop="certification_time">
								<el-date-picker :disabled="disabledObj['certification_time_isDisabled']" v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','certification_time')) || (!form['achievement_certification_id'] && $check_field('add','certification_time'))" id="certification_time"
						v-model="form['certification_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','certification_time')">{{form['certification_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','content_of_achievements') || $check_field('add','content_of_achievements') || $check_field('set','content_of_achievements')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="成果内容" prop="content_of_achievements">
								<el-input type="textarea" id="content_of_achievements" v-model="form['content_of_achievements']" placeholder="请输入成果内容"
						v-if="user_group === '管理员' || (form['achievement_certification_id'] && $check_field('set','content_of_achievements')) || (!form['achievement_certification_id'] && $check_field('add','content_of_achievements'))" :disabled="disabledObj['content_of_achievements_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','content_of_achievements')">{{form['content_of_achievements']}}</div>
							</el-form-item>
			</el-col>
							<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
				</el-form-item>
			</el-col>
		
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "achievement_certification_id",
				url_add: "~/api/achievement_certification/add?",
				url_set: "~/api/achievement_certification/set?",
				url_get_obj: "~/api/achievement_certification/get_obj?",
				url_upload: "~/api/achievement_certification/upload?",

				query: {
					"achievement_certification_id": 0,
				},

				form: {
								"group_name":  '', // 小组名称
										"group_type":  '', // 小组类型
										"group_teacher": 0, // 小组教师
										"teachers_name":  '', // 教师姓名
										"student_users": 0, // 学生用户
										"student_name":  '', // 学生姓名
										"result_name":  '', // 成果名称
										"result_type":  '', // 成果类型
										"achievement_attachment":  '', // 成果附件
										"certification_time":  '', // 认证时间
										"content_of_achievements":  '', // 成果内容
									"examine_state": "未审核",
								"achievement_certification_id": 0, // ID
						
				},
				disabledObj:{
								"group_name_isDisabled": false,
										"group_type_isDisabled": false,
										"group_teacher_isDisabled": false,
										"teachers_name_isDisabled": false,
										"student_users_isDisabled": false,
										"student_name_isDisabled": false,
										"result_name_isDisabled": false,
										"result_type_isDisabled": false,
										"achievement_attachment_isDisabled": false,
										"certification_time_isDisabled": false,
										"content_of_achievements_isDisabled": false,
										},

	
		
		
					// 用户列表
				list_user_group_teacher: [],
				
		
					// 用户列表
				list_user_student_users: [],
				
		
		
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
				/**
			 * 获取教师用户用户列表
			 */
			async get_list_user_group_teacher() {
                // if(this.user_group !== "管理员" && this.form["group_teacher"] === 0) {
                //     this.form["group_teacher"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=教师用户");
                if(json.result && json.result.list){
                    this.list_user_group_teacher = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_group_teacher(id){
				var obj = this.list_user_group_teacher.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
				/**
			 * 获取学生用户用户列表
			 */
			async get_list_user_student_users() {
                // if(this.user_group !== "管理员" && this.form["student_users"] === 0) {
                //     this.form["student_users"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=学生用户");
                if(json.result && json.result.list){
                    this.list_user_student_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_student_users(id){
				var obj = this.list_user_student_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
						/**
			 * 上传成果附件
			 * @param {Object} param 文件参数
			 */
			upload_achievement_attachment(param){
						this.uploadFile(param.file, "achievement_attachment");
					},
	
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
																																											
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
																				        if (this.form["certification_time"].indexOf("-")===-1){
          this.form["certification_time"] = this.$toTime(parseInt(this.form["certification_time"]),"yyyy-MM-dd")
        }
							$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																													        if(this.form["certification_time"]=="0000-00-00"){
          this.form["certification_time"] = null;
        }
				if(parseInt(this.form["certification_time"]) > 9999){
					this.form["certification_time"] = this.$toTime(parseInt(this.form["certification_time"]),"yyyy-MM-dd")
				}
					


			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																																							return msg;
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/achievement_certification/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/achievement_certification/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/achievement_certification/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/achievement_certification/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/achievement_certification/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
									this.get_list_user_group_teacher();
										this.get_list_user_student_users();
																	},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
