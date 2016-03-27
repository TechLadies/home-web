# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.create(name: 'Salary Issues')
Tag.create(name: 'Illegal Deployment')
Tag.create(name: 'Medical Issue (Non-Work Accident)')
Tag.create(name: 'Medical Issue (Work Accident)')
Tag.create(name: 'Others')

Tag.create(parent_tag_id: '1', name: 'Unpaid Wages')
Tag.create(parent_tag_id: '1', name: 'Late Payment')
Tag.create(parent_tag_id: '1', name: 'Short Payment')
Tag.create(parent_tag_id: '1', name: 'Salary Paid')
Tag.create(parent_tag_id: '1', name: 'Salary Paid is less than IPA (in principle approved) Declared amount')
Tag.create(parent_tag_id: '1', name: 'Basic Salary is more than what is Declared')

Tag.create(parent_tag_id: '2', name: 'Cross-Sector Deployment')
Tag.create(parent_tag_id: '2', name: 'Intra-Sector Deployment')
Tag.create(parent_tag_id: '2', name: 'Occupation Different From Work Pass')

Tag.create(parent_tag_id: '3', name: 'Medical Expenses Paid By Worker')
Tag.create(parent_tag_id: '3', name: 'Not Allowed To Seek Medical Treatment')
Tag.create(parent_tag_id: '3', name: 'Not Allowed To Take Medical Leave')
Tag.create(parent_tag_id: '3', name: 'Not Paid For Medical Leave')

Tag.create(parent_tag_id: '4', name: 'Work Accident Not Reported')
Tag.create(parent_tag_id: '4', name: 'Medical Expenses Paid By Worker')
Tag.create(parent_tag_id: '4', name: 'Medical Leave Wages Not Paid, or Not On Time')
Tag.create(parent_tag_id: '4', name: 'Not Allowed To Seek Treatment or Follow-up Treatment')
Tag.create(parent_tag_id: '4', name: 'Short Payment of Medical Leave')

Tag.create(parent_tag_id: '5', name: 'Unlicensed Agent')
Tag.create(parent_tag_id: '5', name: 'Excessive Agency Fees')
Tag.create(parent_tag_id: '5', name: 'Unethical Doctors')
Tag.create(parent_tag_id: '5', name: 'Deception About Working Conditions')

Tag.create(parent_tag_id: '8', name: 'Not Paid OT, OT <1.5')
Tag.create(parent_tag_id: '8', name: 'Not Paid On Public Holiday, or Not Double')
Tag.create(parent_tag_id: '8', name: 'Rest Day Not Paid Double When Request By Employer')

# Tag.create (
#  [
  	
#  ]
# )