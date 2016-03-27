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
Tag.create(parent_tag_id: '1', name: 'Salary Paid is less than IPA (in principle arpproved) declared amount')
Tag.create(parent_tag_id: '1', name: 'Basic Salary is more than what is declared')

Tag.create(parent_tag_id: '2', name: 'Cross-Sector Deployment')
Tag.create(parent_tag_id: '2', name: 'Intra-Sector Deployment')
Tag.create(parent_tag_id: '2', name: 'Cross-Sector Deployment')