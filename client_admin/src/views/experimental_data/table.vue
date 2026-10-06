<template>
	<el-main class="bg table_wrap">
		<el-form label-position="right" :model="query" class="form p_4" label-width="120">
			<el-row>


							<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="实验名称">
									<el-input v-model="query.experiment_name"></el-input>
								</el-form-item>
				</el-col>
									<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="实验类型">
									<el-select v-model="query.experiment_type">
											<el-option v-for="o in list_experiment_type" :key="o.experiment_type" :label="o.experiment_type"
								:value="o.experiment_type">
							</el-option>
										</el-select>
								</el-form-item>
				</el-col>
																									<el-col :xs="24" :sm="10" :lg="8" class="search_btn_wrap_1">
					<el-form-item>
						<el-button type="primary" @click="search()" class="search_btn_find">查询</el-button>
						<el-button @click="reset()" style="margin-right: 74px;" class="search_btn_reset">重置</el-button>
						<router-link v-if="user_group == '管理员' || $check_action('/experimental_data/table','add') || $check_action('/experimental_data/view','add')" class="el-button el-button--default el-button--primary search_btn_add" to="./view?">添加
						</router-link>
            			<el-button v-if="user_group == '管理员' || $check_action('/experimental_data/table','del') || $check_action('/experimental_data/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
					</el-form-item>
				</el-col>

			</el-row>
		</el-form>
		<el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
			<el-table-column fixed type="selection" tooltip-effect="dark" width="55">
			</el-table-column>
				<el-table-column prop="experiment_name" @sort-change="$sortChange" label="实验名称"
				v-if="user_group == '管理员' || $check_field('get','experiment_name')" min-width="200">
					</el-table-column>
					<el-table-column prop="experiment_type" @sort-change="$sortChange" label="实验类型"
				v-if="user_group == '管理员' || $check_field('get','experiment_type')" min-width="200">
					</el-table-column>
					<el-table-column prop="experimental_time" @sort-change="$sortChange" label="实验时间"
				v-if="user_group == '管理员' || $check_field('get','experimental_time')" min-width="200">
		                <template slot-scope="scope">
                	{{ $toTime(scope.row["experimental_time"],"yyyy-MM-dd") }}
                </template>
					</el-table-column>
					<el-table-column prop="experimental_attachments" @sort-change="$sortChange" label="实验附件"
				v-if="user_group == '管理员' || $check_field('get','experimental_attachments')" min-width="200">
						<template slot-scope="scope">
					<a :href="$fullUrl(scope.row['experimental_attachments'])" target="_blank" style="color: rgb(64, 158, 255);">点击下载</a>
				</template>
					</el-table-column>
					<el-table-column prop="student_users" @sort-change="$sortChange" label="学生用户"
				v-if="user_group == '管理员' || $check_field('get','student_users')" min-width="200">
						<template slot-scope="scope">
					{{ get_user_student_users(scope.row['student_users']) }}
				</template>
					</el-table-column>
					<el-table-column prop="experimental_description" @sort-change="$sortChange" label="实验描述"
				v-if="user_group == '管理员' || $check_field('get','experimental_description')" min-width="200">
					</el-table-column>
					<el-table-column prop="experimental_content" @sort-change="$sortChange" label="实验内容"
				v-if="user_group == '管理员' || $check_field('get','experimental_content')" min-width="200">
					</el-table-column>
					<el-table-column prop="teachers_comments" @sort-change="$sortChange" label="教师评语"
				v-if="user_group == '管理员' || $check_field('get','teachers_comments')" min-width="200">
					</el-table-column>
	



            <el-table-column sortable prop="create_time" label="创建时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["create_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
            </el-table-column>

			<el-table-column sortable prop="update_time" label="更新时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["update_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
			</el-table-column>







			<el-table-column fixed="right" label="操作" min-width="120" v-if="user_group == '管理员' || $check_action('/experimental_data/table','set') || $check_action('/experimental_data/view','set') || $check_action('/experimental_data/view','get') || $check_action('//table','add') || $check_action('//view','add')" >


				<template slot-scope="scope">
					<router-link class="el-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
					v-if="user_group == '管理员' || $check_action('/experimental_data/table','set') || $check_action('/experimental_data/view','set') || $check_action('/experimental_data/view','get')"
						:to="'./view?' + field + '=' + scope.row[field]"
						 size="small">
						<span>详情</span>
					</router-link>
				</template>
			</el-table-column>

		</el-table>

		<!-- 分页器 -->
		<div class="mt text_center">
			<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
				:current-page="query.page" :page-sizes="[7, 10, 30, 100]" :page-size="query.size"
				layout="total, sizes, prev, pager, next, jumper" :total="count">
			</el-pagination>
		</div>
		<!-- /分页器 -->

								
		<div class="modal_wrap" v-if="showModal">
			<div class="modal_box">
				<!-- <div class="modal_box_close" @click="closeModal">X</div> -->
				<p class="modal_box_title">重要提醒</p>
				<p class="modal_box_text">当前有数据达到预警值！</p>
				<div class="btn_box">
					<span @click="closeModal">取消</span>
					<span @click="closeModal">确定</span>
				</div>
			</div>
		</div>


	</el-main>
</template>
<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				// 弹框
				showModal: false,
				// 获取数据地址
				url_get_list: "~/api/experimental_data/get_list?like=0",
				url_del: "~/api/experimental_data/del?",

				// 字段ID
				field: "experimental_data_id",

				// 查询
				query: {
					"size": 7,
					"page": 1,
								"experiment_name": "",
											"experiment_type": "",
														"login_time": "",
					"create_time": "",
					"orderby": `create_time desc`
				},

				// 数据
				list: [],
															// 实验类型列表
				list_experiment_type: [""],
														// 用户列表
				list_user_student_users: [],
										}
		},
		methods: {
			// 关闭弹框
			closeModal(){
				this.showModal = false;
				},

			get_list_before(param){
				var user_group = this.user.user_group;
				if(user_group != "管理员"){
						let sqlwhere = "(";
																														if(user_group=="学生用户"){
						sqlwhere+= "student_users = " + this.user.user_id + " or ";
					}
																									if (sqlwhere.length>1){
						sqlwhere = sqlwhere.substr(0,sqlwhere.length-4);
						sqlwhere += ")";
						param["sqlwhere"] = sqlwhere;
					}
					}
				return param;
			},

						/**
			 * 获取实验类型列表
			 */
			async get_list_experiment_type() {
				var json = await this.$get("~/api/experiment_type/get_list?");
				if(json.result){
					this.list_experiment_type = json.result.list;
				}else if (json.error){
					console.log(json.error);
				}
			},
														



												/**
			 * 获取学生用户用户列表
			 */
			async get_list_user_student_users() {
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
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
				}
				return ret;
			},
											deleteRow(index, rows) {
				rows.splice(index, 1);
			}

		},
		created() {
						// 初始化实验类型列表
			this.get_list_experiment_type();
													this.get_list_user_student_users();
									}
	}
</script>

<style type="text/css">
	.bg {
		background: white;
	}

	.form.p_4 {
		padding: 1rem;
	}

	.form .el-input {
		width: initial;
	}

	.mt {
		margin-top: 1rem;
	}

	.text_center {
		text-align: center;
	}

	.float-right {
		float: right;
	}


	.modal_wrap{
		width: 100vw;
		height: 100vh;
		position: fixed;
		top: 0;
		left: 0;
		background: rgba(0,0,0,0.5);
		z-index: 9999999999;
	}
	.modal_wrap .modal_box{
		width: 400px;
		height: 200px;
		background: url("../../assets/modal_bg.jpg") no-repeat center;
		background-size: cover;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-left: -200px;
		margin-top: -100px;
		border-radius: 10px;
		}
	.modal_wrap .modal_box .modal_box_close{
		font-size: 20px;
		position: absolute;
		top: 10px;
		right: 10px;
		cursor: pointer;
		}
	.modal_wrap .modal_box .modal_box_title{
	  text-align: center;
    font-size: 18px;
    margin: 16px auto;
    color: #fff;
    border-bottom: 1px solid rgba(117, 116, 116,0.5);
    padding-bottom: 16px;
    width: 356px;
		}
	.modal_wrap .modal_box .modal_box_text{
			text-align: center;
		font-size: 15px;
		color: #fff;
		margin-top: 25px;
		}
	.modal_wrap .modal_box .btn_box{
		display: flex;
		flex-direction: row;
		justify-content: center;
		margin-top: 42px;
		}
			.modal_wrap .modal_box .btn_box span{
				display: inline-block;
				width: 80px;
				height: 30px;
				line-height: 30px;
				text-align: center;
				border: 1px solid #ccc;
				font-size: 14px;
				cursor: pointer;
				color: #fff;
			}
	.modal_wrap .modal_box .btn_box span:nth-child(2){
		background: #409EFF;
		color: #fff;
		border-color: #409EFF;
		margin-left: 15px;
	}
</style>
