# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

salary_issue_tag = Tag.create(name: 'Salary Issues', description: 'Replace this')
illegal_deployment_tag = Tag.create(name: 'Illegal Deployment', description: 'Replace this')
medical_issue_non_work_tag = Tag.create(name: 'Medical Issue (Non-Work Accident)', description: 'Replace this')
medical_issue_work_tag = Tag.create(name: 'Medical Issue (Work Accident)', description: 'Replace this')
others_tag = Tag.create(name: 'Others', description: 'Replace this')

Tag.create(parent: salary_issue_tag, name: 'Unpaid Wages', description: 'Replace this')
Tag.create(parent: salary_issue_tag, name: 'Late Payment', description: 'Replace this')
short_payment_tag = Tag.create(parent: salary_issue_tag, name: 'Short Payment', description: 'Replace this')
Tag.create(parent: salary_issue_tag, name: 'Salary Paid', description: 'Replace this')
Tag.create(parent: salary_issue_tag, name: 'Salary Paid is less than IPA (in principle approved) Declared amount', description: 'Replace this')
Tag.create(parent: salary_issue_tag, name: 'Basic Salary is more than what is Declared', description: 'Replace this')

Tag.create(parent: illegal_deployment_tag, name: 'Cross-Sector Deployment', description: 'Replace this')
Tag.create(parent: illegal_deployment_tag, name: 'Intra-Sector Deployment', description: 'Replace this')
Tag.create(parent: illegal_deployment_tag, name: 'Occupation Different From Work Pass', description: 'Replace this')

Tag.create(parent: medical_issue_non_work_tag, name: 'Medical Expenses Paid By Worker', description: 'Replace this')
Tag.create(parent: medical_issue_non_work_tag, name: 'Not Allowed To Seek Medical Treatment', description: 'Replace this')
Tag.create(parent: medical_issue_non_work_tag, name: 'Not Allowed To Take Medical Leave', description: 'Replace this')
Tag.create(parent: medical_issue_non_work_tag, name: 'Not Paid For Medical Leave', description: 'Replace this')

Tag.create(parent: medical_issue_work_tag, name: 'Work Accident Not Reported', description: 'Replace this')
Tag.create(parent: medical_issue_work_tag, name: 'Medical Expenses Paid By Worker', description: 'Replace this')
Tag.create(parent: medical_issue_work_tag, name: 'Medical Leave Wages Not Paid, or Not On Time', description: 'Replace this')
Tag.create(parent: medical_issue_work_tag, name: 'Not Allowed To Seek Treatment or Follow-up Treatment', description: 'Replace this')
Tag.create(parent: medical_issue_work_tag, name: 'Short Payment of Medical Leave', description: 'Replace this')

Tag.create(parent: others_tag, name: 'Unlicensed Agent', description: 'Replace this')
Tag.create(parent: others_tag, name: 'Excessive Agency Fees', description: 'Replace this')
Tag.create(parent: others_tag, name: 'Unethical Doctors', description: 'Replace this')
Tag.create(parent: others_tag, name: 'Deception About Working Conditions', description: 'Replace this')

Tag.create(parent: short_payment_tag, name: 'Not Paid OT, OT <1.5', description: 'Replace this')
Tag.create(parent: short_payment_tag, name: 'Not Paid On Public Holiday, or Not Double', description: 'Replace this')
Tag.create(parent: short_payment_tag, name: 'Rest Day Not Paid Double When Request By Employer', description: 'Replace this')
