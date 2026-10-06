<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','experiment_name') || $check_field('add','experiment_name') || $check_field('set','experiment_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="实验名称" prop="experiment_name">
												<el-input id="experiment_name" v-model="form['experiment_name']" placeholder="请输入实验名称"
							  v-if="user_group === '管理员' || (form['experimental_data_id'] && $check_field('set','experiment_name')) || (!form['experimental_data_id'] && $check_field('add','experiment_name'))" :disabled="disabledObj['experiment_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','experiment_name')">{{form['experiment_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','experiment_type') || $check_field('add','experiment_type') || $check_field('set','experiment_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="实验类型" prop="experiment_type">
								<el-select id="experiment_type" v-model="form['experiment_type']"
						v-if="user_group === '管理员' || (form['experimental_data_id'] && $check_field('set','experiment_type')) || (!form['experimental_data_id'] && $check_field('add','experiment_type'))">
						<el-option v-for="o in list_experiment_type" :key="o['experiment_type']" :label="o['experiment_type']"
							:value="o['experiment_type']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','experiment_type')">{{form['experiment_type']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','experimental_time') || $check_field('add','experimental_time') || $check_field('set','experimental_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="实验时间" prop="experimental_time">
								<el-date-picker :disabled="disabledObj['experimental_time_isDisabled']" v-if="user_group === '管理员' || (form['experimental_data_id'] && $check_field('set','experimental_time')) || (!form['experimental_data_id'] && $check_field('add','experimental_time'))" id="experimental_time"
						v-model="form['experimental_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','experimental_time')">{{form['experimental_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','experimental_attachments') || $check_field('add','experimental_attachments') || $check_field('set','experimental_attachments')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="实验附件" prop="experimental_attachments">
												<div v-if="disabledObj['experimental_attachments_isDisabled']">
						<div v-if="$check_field('get','experimental_attachments')">
							<el-button type="primary" @click="$download($fullUrl(form['experimental_attachments']),form['experimental_attachments'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
					<div v-else>
						<el-upload v-if="user_group === '管理员' || (form['experimental_data_id'] && $check_field('set','experimental_attachments')) || (!form['experimental_data_id'] && $check_field('add','experimental_attachments'))" class="upload-demo" drag
								   action="" style="max-width: 300px;width: 100%;" :http-request="upload_experimental_attachments" :limit="1" accept="">
							<i class="el-icon-upload"></i>
							<div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
						</el-upload>
						<div v-else-if="$check_field('get','experimental_attachments')">
							<el-button type="primary" @click="$download($fullUrl(form['experimental_attachments']),form['experimental_attachments'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_users') || $check_field('add','student_users') || $check_field('set','student_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生用户" prop="student_users">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_student_users(form['student_users']) }}
							<!--<el-input id="business_name" v-model="form['student_users']" placeholder="请输入学生用户"-->
							<!--v-if="user_group === '管理员' || (form['experimental_data_id'] && $check_field('set','student_users')) || (!form['experimental_data_id'] && $check_field('add','student_users'))" :disabled="disabledObj['student_users_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','student_users')">{{form['student_users']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['experimental_data_id'] && $check_field('set','student_users')) || (!form['experimental_data_id'] && $check_field('add','student_users'))" id="student_users" v-model="form['student_users']" :disabled="disabledObj['student_users_isDisabled']">
								<el-option v-for="o in list_user_student_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','student_users')" id="student_users" v-model="form['student_users']" :disabled="true">
								<el-option v-for="o in list_user_student_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="student_users" v-model="form['student_users']" :disabled="disabledObj['student_users_isDisabled']">
							<el-option v-for="o in list_user_student_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','experimental_description') || $check_field('add','experimental_description') || $check_field('set','experimental_description')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="实验描述" prop="experimental_description">
								<el-input type="textarea" id="experimental_description" v-model="form['experimental_description']" placeholder="请输入实验描述"
						v-if="user_group === '管理员' || (form['experimental_data_id'] && $check_field('set','experimental_description')) || (!form['experimental_data_id'] && $check_field('add','experimental_description'))" :disabled="disabledObj['experimental_description_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','experimental_description')">{{form['experimental_description']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','experimental_content') || $check_field('add','experimental_content') || $check_field('set','experimental_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="实验内容" prop="experimental_content">
								<el-input type="textarea" id="experimental_content" v-model="form['experimental_content']" placeholder="请输入实验内容"
						v-if="user_group === '管理员' || (form['experimental_data_id'] && $check_field('set','experimental_content')) || (!form['experimental_data_id'] && $check_field('add','experimental_content'))" :disabled="disabledObj['experimental_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','experimental_content')">{{form['experimental_content']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teachers_comments') || $check_field('add','teachers_comments') || $check_field('set','teachers_comments')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师评语" prop="teachers_comments">
								<el-input type="textarea" id="teachers_comments" v-model="form['teachers_comments']" placeholder="请输入教师评语"
						v-if="user_group === '管理员' || (form['experimental_data_id'] && $check_field('set','teachers_comments')) || (!form['experimental_data_id'] && $check_field('add','teachers_comments'))" :disabled="disabledObj['teachers_comments_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teachers_comments')">{{form['teachers_comments']}}</div>
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
				field: "experimental_data_id",
				url_add: "~/api/experimental_data/add?",
				url_set: "~/api/experimental_data/set?",
				url_get_obj: "~/api/experimental_data/get_obj?",
				url_upload: "~/api/experimental_data/upload?",

				query: {
					"experimental_data_id": 0,
				},

				form: {
								"experiment_name":  '', // 实验名称
										"experiment_type":  '', // 实验类型
										"experimental_time":  '', // 实验时间
										"experimental_attachments":  '', // 实验附件
										"student_users": 0, // 学生用户
										"experimental_description":  '', // 实验描述
										"experimental_content":  '', // 实验内容
										"teachers_comments":  '', // 教师评语
											"experimental_data_id": 0, // ID
						
				},
				disabledObj:{
								"experiment_name_isDisabled": false,
										"experiment_type_isDisabled": false,
										"experimental_time_isDisabled": false,
										"experimental_attachments_isDisabled": false,
										"student_users_isDisabled": false,
										"experimental_description_isDisabled": false,
										"experimental_content_isDisabled": false,
										"teachers_comments_isDisabled": false,
										},

	
						// 实验类型选项列表
				list_experiment_type: [""],
	
		
		
		
					// 用户列表
				list_user_student_users: [],
						// 用户组
				group_user_student_users: "",
				
		
		
	
			}
		},
		methods: {


	
	
			
				/**
			 * 获取实验类型列表
			 */
			async get_list_experiment_type() {
				var json = await this.$get("~/api/experiment_type/get_list?");
				if(json.result && json.result.list){
					this.list_experiment_type = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
			
	
						/**
			 * 上传实验附件
			 * @param {Object} param 文件参数
			 */
			upload_experimental_attachments(param){
						this.uploadFile(param.file, "experimental_attachments");
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
					/**
			 * 获取学生用户用户组
			 */
			async get_group_user_student_users() {
							this.form["student_users"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=学生用户");
				if(json.result && json.result.obj){
					this.group_user_student_users = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_student_users(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_student_users.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["student_users"] = id
									_this.disabledObj['student_users' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "student_users") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
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
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																																																		
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
						        if (this.form["experimental_time"].indexOf("-")===-1){
          this.form["experimental_time"] = this.$toTime(parseInt(this.form["experimental_time"]),"yyyy-MM-dd")
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


								        if(this.form["experimental_time"]=="0000-00-00"){
          this.form["experimental_time"] = null;
        }
				if(parseInt(this.form["experimental_time"]) > 9999){
					this.form["experimental_time"] = this.$toTime(parseInt(this.form["experimental_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/experimental_data/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/experimental_data/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/experimental_data/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/experimental_data/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/experimental_data/view','get');
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
						this.get_list_experiment_type();
											this.get_list_user_student_users();
					this.get_group_user_student_users();
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
