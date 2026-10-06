<template>
	<div>
			<el-form-item v-if="$check_register_field('add','teachers_name','/teacher_users/view')" label="教师姓名" prop="teachers_name">
				<el-input id="teachers_name" v-model="form['teachers_name']" placeholder="请输入教师姓名"></el-input>
				</el-form-item>
				<el-form-item v-if="$check_register_field('add','gender_of_teachers','/teacher_users/view')" label="教师性别" prop="gender_of_teachers">
				<el-select id="gender_of_teachers" v-model="form['gender_of_teachers']">
			<el-option v-for="o in list_gender_of_teachers" :key="o" :label="o" :value="o">
			</el-option>
		</el-select>
				</el-form-item>
				<el-form-item v-if="$check_register_field('add','age_of_teachers','/teacher_users/view')" label="教师年龄" prop="age_of_teachers">
				<el-input id="age_of_teachers" v-model="form['age_of_teachers']" placeholder="请输入教师年龄"></el-input>
				</el-form-item>
	
	</div>
</template>

<script>
	import mixin from "@/mixins/component.js";

	export default {
		mixins: [mixin],
		props:{

			form:{
				type: Object,
				default: function(){
					return {
							"teachers_name":  '' ,
								"gender_of_teachers":  '' ,
								"age_of_teachers":  '' ,
						}
				}
			},

		},
		data() {
			return {
				field: "teacher_users_id",
				url_add: "~/api/teacher_users/add?",
				url_set: "~/api/teacher_users/set?",
				url_upload: "~/api/teacher_users/upload?",

						list_gender_of_teachers: ['男','女'],
		
				rules: {
					"teachers_name": [     ],
					"gender_of_teachers": [    {required: true,message: '教师性别不能为空'},  ],
					"age_of_teachers": [    {required: true,message: '教师年龄不能为空'},  ],
				}

			}
		},
		methods: {

	
	
	

	
	
	

	
	
	

		},
		created() {
					}
	}
</script>
