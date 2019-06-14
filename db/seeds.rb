# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

patterns = [
  [
    "Check something",
    "Lorem ipsum dolor amet poke organic snackwave readymade direct trade hot chicken tbh williamsburg authentic tote bag vape vexillologist cliche fam selfies. Brunch franzen cray, four loko live-edge kitsch hoodie chia. "],
  [
    "Register for something",
    "Lorem ipsum dolor amet poke organic snackwave readymade direct trade hot chicken tbh williamsburg authentic tote bag vape vexillologist cliche fam selfies. Brunch franzen cray, four loko live-edge kitsch hoodie chia. "],
  [
    "Tell something",
    "Lorem ipsum dolor amet poke organic snackwave readymade direct trade hot chicken tbh williamsburg authentic tote bag vape vexillologist cliche fam selfies. Brunch franzen cray, four loko live-edge kitsch hoodie chia. "],
  [
    "Request something",
    "Lorem ipsum dolor amet poke organic snackwave readymade direct trade hot chicken tbh williamsburg authentic tote bag vape vexillologist cliche fam selfies. Brunch franzen cray, four loko live-edge kitsch hoodie chia. "],
  [
    "Apply for something",
    "Lorem ipsum dolor amet poke organic snackwave readymade direct trade hot chicken tbh williamsburg authentic tote bag vape vexillologist cliche fam selfies. Brunch franzen cray, four loko live-edge kitsch hoodie chia. "],
  [
    "Book something",
    "Lorem ipsum dolor amet poke organic snackwave readymade direct trade hot chicken tbh williamsburg authentic tote bag vape vexillologist cliche fam selfies. Brunch franzen cray, four loko live-edge kitsch hoodie chia. "],
  [
    "Update something",
    "Lorem ipsum dolor amet poke organic snackwave readymade direct trade hot chicken tbh williamsburg authentic tote bag vape vexillologist cliche fam selfies. Brunch franzen cray, four loko live-edge kitsch hoodie chia. "]
]
patterns.each do |name, description|
  Pattern.create(name: name, description: description)
end